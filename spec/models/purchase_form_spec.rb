require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end
  describe '商品の購入' do
    context '商品の購入がうまく行く時' do
      it 'address_code、cityとaddress_number、telとprefectureが存在すれば登録できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '商品の購入がうまくいかない時' do
      it 'address_codeが空だと登録できない' do
        @purchase_form.address_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Address code can't be blank" && "Address code is invalid"
      end

      it 'address_codeが半角数字で入力されていない' do
        @purchase_form.address_code = '１９４−０４０３'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Address code is invalid"
      end

      it 'address_codeにハイフンが含まれていない' do
        @purchase_form.address_code = '1940403'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Address code is invalid"
      end

      it 'cityが空だと登録できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "City can't be blank" && "City is invalid"
      end

      it 'cityにアルファベットが含まれていると登録できない' do
        @purchase_form.city = 'yokohamasi'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "City is invalid"
      end

      it 'address_numberが空だと登録できない' do
        @purchase_form.address_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Address number can't be blank"
      end

      it 'telが空だと登録できない' do
        @purchase_form.tel = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Tel can't be blank"
      end

      it 'telに半角数字以外が入力されると登録できない' do
        @purchase_form.tel = 'aaaaaaaaaaa'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Tel is invalid"
      end

      it 'telが9桁以下で入力されると購入できない' do
        @purchase_form.tel = '090123456'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Tel is invalid"
      end

      it 'prefectureが未選択だと購入できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Prefecture must be other than 1"
      end
    end
  end
end
