require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
      it 'passwordが英数字を両方使用していれば登録できる' do
        @user.password = 'k11111'
        @user.password_confirmation = 'k11111'
        expect(@user).to be_valid
      end
      it 'first_nameが漢字、ひらがな、カタカナを使用していれば登録できる' do
        @user.first_name = '阿あア'
        expect(@user).to be_valid
      end
      it 'last_nameが漢字、ひらがな、カタカナを使用していれば登録できる' do
        @user.last_name = '和わワ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナのみを使用していれば登録できる' do
        @user.first_name_kana = 'ア'
        expect(@user).to be_valid
      end
      it 'last_name_kanaがカタカナのみを使用していれば登録できる' do
        @user.last_name_kana = 'ワ'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかなとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが英数字の片方しか使っていないと登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First_name can't be blank" && 'First name is invalid'
      end

      it 'first_nameが漢字、ひらがな、カタカナ以外を使用していると登録できない' do
        @user.first_name = 'Aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank" && 'Last name is invalid'
      end

      it 'last_nameが漢字、ひらがな、カタカナ以外を使用していると登録できない' do
        @user.last_name = 'Bb'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank" && 'First name kana is invalid'
      end

      it 'first_name_kanaがカタカナ以外を使用しているとき登録できない' do
        @user.first_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank" && 'Last name kana is invalid'
      end

      it 'last_name_kanaがカタカナ以外使用しているとき登録できない' do
        @user.last_name_kana = 'い'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end