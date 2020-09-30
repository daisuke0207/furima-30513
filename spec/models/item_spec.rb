require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'name,description,category_id,status_id,ship_fee_id,ship_area_id,ship_day_id,price,imageが存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと'do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end


    it 'category_idが1では登録できないこと'do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが1では登録できないこと'do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'ship_fee_idが1では登録できないこと'do
      @item.ship_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship fee must be other than 1")
    end

    it 'ship_area_idが1では登録できないこと'do
      @item.ship_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship area must be other than 1")
    end

    it 'ship_day_idが1では登録できないこと'do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day must be other than 1")
    end


    it 'priceが空では登録できないこと'do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300以上でないと登録できないこと'do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it 'priceが¥9,999,999以下でないと登録できないこと'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it 'imgaeが空では登録できないこと'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'userが紐づいていないと登録できないこと'do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end
end