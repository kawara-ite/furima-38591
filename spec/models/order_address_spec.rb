require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @orderaddress = FactoryBot.build(:orderaddress, user_id: @user.id, item_id: @item.id)

  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@orderaddress).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @orderaddress.building = ''
        expect(@orderaddress).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'カード情報がないと購入できない' do  #("Token can't be blank")#
        
      end
      it 'postal_codeがないと購入できない' do
        @orderaddress.postal_code = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @orderaddress.postal_code = '123456'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角文字列だと購入できない' do
        @orderaddress.postal_code = '１２３−４５６'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idがないと購入できない' do
        @orderaddress.prefecture_id = 1
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityがないと購入できない' do
        @orderaddress.city = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("City can't be blank")
      end
      it 'addressがないと購入できない' do
        @orderaddress.address = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberがないと購入できない' do
        @orderaddress.phone_number = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁だと購入できない' do
        @orderaddress.phone_number = '123456789'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが12桁だと購入できない' do
        @orderaddress.phone_number = '090123456789'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが全角だと購入できない' do
        @orderaddress.phone_number = '０９０１２３４５６７８'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが文字列だと購入できない' do
        @orderaddress.phone_number = 'abcdefghij'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
