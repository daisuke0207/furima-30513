require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '配送先の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeには、ハイフンがないと保存できないこと' do
      @user_order.postal_code = 1_234_567
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが1では保存できないこと' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では保存できないこと' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'blockが空では保存できないこと' do
      @user_order.block = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Block can't be blank")
    end

    it 'buildingが空でも保存できること' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end

    it 'phoneが空では保存できないこと' do
      @user_order.phone = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone can't be blank")
    end

    it 'phoneは半角数字のみ保存可能であること' do
      @user_order.phone = '11-11111'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone is invalid')
    end

    it 'tokenが空では保存できないこと' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
