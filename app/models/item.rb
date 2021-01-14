class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  validates :category_id, :condition_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :name, :description, :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
