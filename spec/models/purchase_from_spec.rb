require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase_from = FactoryBot.build(:purchase_from)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空のとき' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空のとき' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空のとき' do
        @purchase_form.post_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Post_code can't be blank", 'is invalid. Enter it as follows (e.g., 123-4567)')
      end

      it '都道府県が「---」のとき' do
        @purchase_form.area_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area must be other than 0")
      end

      it '市町村が空のとき' do
        @purchase_form.city_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City must be other than 0")
      end


      it '番地が空のとき' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空のとき'do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone_number can't be blank")
      end
    end
  end
end




