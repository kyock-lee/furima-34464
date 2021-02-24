require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test_image.jpeg')
  end

  describe '商品出品'  do
    context '商品出品できるとき' do

      it '全ての入力が完了していれば出品できる' do
        expect(@item).to be_valid
      end

    end

    context '商品出品ができないとき' do
        it 'imageが空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'item_nameが空だと出品できない' do
          @item.item_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it 'descriptionが空だと出品できない' do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'category_idが空だと出品できない' do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'status_idが空だと出品できない' do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'Shipping_charge_idが空だと出品できない' do
          @item.shipping_charge_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end

        it 'shipping_area_idが空だと出品できない' do
          @item.shipping_area_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end

        it 'shipping_day_idが空だと出品できない' do
          @item.shipping_day_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end

        it 'costが空だと出品できない' do
          @item.cost = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost can't be blank")
        end

        it 'costが全角数字だと出品できない' do
          @item.cost = "３０００"
          @item.valid?
          binding.pry
          expect(@item.errors.full_messages).to include("Cost is not a number.")
        end

        it 'costが設定範囲外だと出品できない' do
          @item.cost = 1000000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost is not a number")
        end

    end
  end
end
