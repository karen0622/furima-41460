require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   
  describe '商品出品登録' do
    context '商品が出品できる場合' do
      it "必須項目が全て記入できていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do

      it "userが紐づいていなければ登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "画像が添付されていないとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空欄のとき" do
        @item.name = ""  
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      

      it "商品の説明が空欄のとき" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーの入力が「---」のとき" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態の入力が「---」のとき" do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 0")
      end

      it "配送料の負担の入力が「---」のとき" do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
      end

      it "発送元の地域の入力が「---」のとき" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end

      it "発送までの日数の入力が「---」のとき" do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
      end

      it "価格が空欄の場合" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格の数値が半角数値でないとき" do
        @item.price = "１０００" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "価格が300円未満では出品できない" do
       @item.price = 10
       @item.valid?
       expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "価格が9_999_999円を超えると出品できない"do
       @item.price = 10_000_000
       @item.valid?
       expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end