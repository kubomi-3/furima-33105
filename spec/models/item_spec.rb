require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    it '情報を正しく入力すれば登録できる' do
      expect(@item).to be_valid
    end
    it '画像がなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がなければ出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がなければ出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが選択されてなければ出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態が選択されてなければ出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it '配送料の負担について選択されてなければ出品できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it '発送元が選択されてなければ出品できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end
    it '発送までの日数が選択されてなければ出品できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
    it '価格がなければ出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が¥9,999,999以上では出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '価格は半角数字でなけれ出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
