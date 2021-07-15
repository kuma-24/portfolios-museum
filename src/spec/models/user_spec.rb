require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context '新規登録ができるテスト' do
      it 'name, email, password, password_confirmation, が存在すると新規登録できる' do
        expect(@user).to be_valid
      end

      it 'nameが５０文字以下' do
        @user.name = Faker::Internet.username(specifier: 50..50)
        expect(@user).to be_valid
      end

      it 'emailが一意' do
        @user.email = Faker::Internet.free_email
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字且つ６桁以下' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it 'passeordとpassword_confirmationが一致' do
        @user.password = '123def'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないテスト' do
      it 'nameが無い' do
        @user.name = nil
        @user.valid?
        expect(@user.errors[:name]).to include('を入力してください')
      end

      it 'nameが５１文字以上' do
        @user.name = Faker::Internet.username(specifier: 51..55)
        @user.valid?
        expect(@user.errors[:name]).to include('は50文字以内で入力してください')
      end

      it 'emailが無い' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include('を入力してください')
      end

      it 'emailが一意ではない' do
        @user.email = 'a'
        @user.valid?
        expect(@user.errors[:email]).to include('は無効な値です')
      end

      it 'emailが重複' do
        @user.save
        user_other = FactoryBot.build(:user)
        user_other.email = @user.email
        user_other.valid?
        expect(user_other.errors[:email]).to include('はすでに存在します')
      end

      it 'passwordが無い' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include('を入力してください')
      end

      it 'passwordが英全角' do
        @user.password = 'ＡＢＣＤＥＦ'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが英小文字のみ' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'password, が英全角半角混合' do
        @user.password = 'ＡＢＣdef'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが英全角と数字' do
        @user.password = 'ＡＢＣ123'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが全角数字' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが全角数字と英半角' do
        @user.password = 'abc１２３'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが全角英数字' do
        @user.password = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordがひらがな' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが漢字' do
        @user.password = '漢字漢字漢字'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが記号' do
        @user.password = '^-¥]:_/'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが数字のみ' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include('は無効な値です')
      end

      it 'passwordが６桁未満' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors[:password]).to include('は6文字以上で入力してください')
      end

      it 'password_confirmationが無い' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end

      it 'password_confirmationが一致しない' do
        @user.password = '123abc'
        @user.password_confirmation = '321abc'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
