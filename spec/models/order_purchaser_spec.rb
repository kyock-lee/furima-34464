require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test_image.jpeg')
    @item.save
    @order_purchaser = FactoryBot.build(:order_purchaser, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '必須項目の入力が完了していれば商品購入できる' do
        expect(@order_purchaser).to be_valid
      end

      it '建物名の入力がなくても購入できる' do
        @order_purchaser.building_name = ''
        expect(@order_purchaser).to be_valid
      end

      it '電話番号は10桁でも購入できる' do
        @order_purchaser.phone_number = '0123456789'
        expect(@order_purchaser).to be_valid
      end

    end

    context '商品購入ができないとき' do
      it 'カード情報ないと購入できない' do
        @order_purchaser.token = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと購入できない' do
        @order_purchaser.post_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code can't be blank",
                                                                 'Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号にハイフン(-)がないと購入できない' do
        @order_purchaser.post_code = '1234567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号が全角数字だと購入できない' do
        @order_purchaser.post_code = '１２３-４５６７'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県を選択しないと購入できない' do
        @order_purchaser.shipping_area_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '選択した都道府県のid(shipping_area_id)が1以外でないと購入できない' do
        @order_purchaser.shipping_area_id = 1
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '市区町村を入力しないと購入できない' do
        @order_purchaser.shipping_city = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Shipping city can't be blank")
      end

      it '番地を入力しないと購入できない' do
        @order_purchaser.shipping_address = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Shipping address can't be blank")
      end

      it '電話番号を入力しないと購入できない' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁、11桁でないと購入できない' do
        @order_purchaser.phone_number = '012345678910'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号に半角数字以外が含まれると購入できない' do
        @order_purchaser.phone_number = '０１２３４５６７８９１'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
