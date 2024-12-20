require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_form).to be_valid
      end

      it '建物名がなくても保存できる' do
        @purchase_form.building = nil
        expect(@purchase_form).to be_valid
      end
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
        expect(@purchase_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g., 123-4567)")
      end

      it '郵便番号にハイフンがないとき' do
      @purchase_form.post_code = '1234567'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g., 123-4567)")
       end

      it '都道府県が「---」のとき' do
        @purchase_form.area_id = '0'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area can't be blank")
      end

      it '市町村が空のとき' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end


      it '番地が空のとき' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空のとき'do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end


      it '電話番号が9桁以下では購入できない' do
        @purchase_form.phone_number = '12345678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_form.phone_number = '0123456789123'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
   

      it '数字以外の文字が入ったとき'do
      @purchase_form.phone_number = '1234abcd'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end



      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end




