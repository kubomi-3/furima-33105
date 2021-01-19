require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@user_order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'zip_codeが空では購入できない' do
        @user_order.zip_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid. Include hyphen(-)')
      end
      it 'zip_codeにハイフンが含まれていなければ購入できない' do
        @user_order.zip_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it 'area_idが選択されていなければ購入できない' do
        @user_order.area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空では登録できない' do
        @user_order.municipality = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @user_order.telephone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberにハイフンが含まれていれば購入できない' do
        @user_order.telephone_number = '1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone number is invalid. Don't include hyphen(-)")
      end
      it 'telephone_numberが12桁以上だと購入できない' do
        @user_order.telephone_number = '123456789012'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone number is invalid. Don't include hyphen(-)")
      end
      it 'telephone_numberが全角数字では購入できない' do
        @user_order.telephone_number = '０９０１２３４５６７８'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Telephone number is invalid. Don't include hyphen(-)")
      end
      it 'tokenが空では購入できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
