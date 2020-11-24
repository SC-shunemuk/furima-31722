require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品の保存ができる場合" do
      it "imageとname、contentとcategory、statusとbear_price、shipping_addressとshipping_day、priceがあれば商品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品の保存ができない場合" do
      it "ユーザーが紐づいていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "imageが空だと商品を保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "contentが空だと保存できない" do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "category未選択だと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "statusが未選択だと保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "bear_priceが未選択だと保存できない" do
        @item.bear_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Bear price must be other than 1")
      end
      it "shipping_addressが未選択だと保存できない" do
        @item.shipping_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address must be other than 1")
      end
      it "shipping_dayが未選択だと保存できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "priceが空だと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank" && "Price is not a number" && "Price is invalid")
      end

      it "priceが半角数字以外で入力されていると保存できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300以下だと保存できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが9,999,999以上だと保存できない" do
        @item.price = "99_999_999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
