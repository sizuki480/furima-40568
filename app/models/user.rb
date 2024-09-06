class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, presence: true

  # パスワード英数混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :encrypted_password, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birthday, presence: true

  # アソシエーション
  has_many :items
  has_many :buys
end

# ## usersテーブル

# | Column             | Type   | Options |
# | ------------------ | ------ | ------------------------- |
# | nickname           | string | null: false |
# | email              | string | null: false  unique: true |
# | encrypted_password | string | null: false |
# | last_name          | string | null: false |
# | first_name         | string | null: false |
# | last_name_kana     | string | null: false |
# | first_name_kana    | string | null: false |
# | birthday           | date   | null: false |

# ### Association

# - has_many :items
# - has_many :buys
