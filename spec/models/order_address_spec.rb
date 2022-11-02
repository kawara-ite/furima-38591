require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeがないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_address.postal_code = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code  is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが全角文字列だと購入できない' do
        @order_address.postal_code = '１２３−４５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code  is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idがないと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityがないと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがないと購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがないと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁だと購入できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  is invalid. Input only number')
      end
      it 'phone_numberが12桁だと購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  is invalid. Input only number')
      end
      it 'phone_numberが全角だと購入できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  is invalid. Input only number')
      end
      it 'phone_numberが文字列だと購入できない' do
        @order_address.phone_number = 'abcdefghij'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
