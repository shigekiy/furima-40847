class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  # 変数VALID_PASSWORD_REGEXに６文字以上の半角英数字混同させるオプションを代入する
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  # ヘルパーに全角ひらがな、カタカナ、漢字で入力させるオプションを記述
  validates :last_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  # 全角カタカナで入力させるオプションを記述
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birthday, presence: true
end
