class UserOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :municipality, :address, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :municipality, :address, :token, :item_id, :user_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :telephone_number, format: { with: /\A[0-9]{,11}\z/, message: "is invalid. Don't include hyphen(-)" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(zip_code: zip_code, area_id: area_id, municipality: municipality, address: address,
                       building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
