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
      it 'name, が５０文字以下' do
        @user.name = Faker::Internet.username(specifier: 50..50)
        expect(@user).to be_valid
      end
      it 'email, が一意' do
        @user.email = Faker::Internet.free_email
        expect(@user).to be_valid
      end
      it 'password, が半角英数字且つ６桁以下' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passeord, password_confirmation, が一致' do
        @user.password = '123abc'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないテスト' do
      it 'name, が無い' do
        @user.name = nil
        @user.valid?
        expect(@user.errors[:name]).to include("を入力してください")
      end
      it 'name, が５１文字以上' do
        @user.name = Faker::Internet.username(specifier: 51..55)
        @user.valid?
        expect(@user.errors[:name]).to include("は50文字以内で入力してください")
      end
      it 'email, が無い' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("を入力してください")
      end
      it 'email, が一意ではない' do
        @user.email = 'a'
        @user.valid?
        expect(@user.errors[:email]).to include("は無効な値です")
      end
      it 'email, が重複' do
        @user.save
        user_1 = FactoryBot.build(:user)
        user_1.email = @user.email
        user_1.valid?
        expect(user_1.errors[:email]).to include("はすでに存在します")
      end
      it 'password, が無い' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("を入力してください")
      end
      it 'password, が英全角' do
        @user.password = 'ＡＢＣＤＥＦ'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が英小文字のみ' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が英全角半角混合' do
        @user.password = 'ＡＢＣdef'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が英全角と数字' do
        @user.password = 'ＡＢＣ123'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が全角数字' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が全角数字と英半角' do
        @user.password = 'abc１２３'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が全角英数字' do
        @user.password = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, がひらがな' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が漢字' do
        @user.password = '漢字漢字漢字'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が記号' do
        @user.password = '^-¥]:_/'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が数字のみ' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include("は無効な値です")
      end
      it 'password, が６桁未満' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors[:password]).to include("は6文字以上で入力してください")
      end
      it 'password_confirmation, が無い' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      it 'password_confirmation, が一致しない' do
        @user.password = '123abc'
        @user.password_confirmation = '321abc'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end
