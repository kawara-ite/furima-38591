require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @address = FactoryBot.build(:address, user_id: @user.id, item_id: @item.id)

  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,city,address,phone_number,があれば出品できる' do
        expect(@address).to be_valid
      end
    end

end
