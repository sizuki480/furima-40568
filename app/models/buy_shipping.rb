class BuyShipping
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :shipping_area_id, :city, :addres, :building, :tel, :buy
end

# バリデーション
with_options presence: true do
  validates :item_id # belongs_toの置き換え
  validates :user_id # belongs_toの置き換え
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :shipping_area, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :tel
  validates :buy_id # belongs_toの置き換え
end

# 保存処理
def save
end

# ## buysテーブル
# | Column    | Type       | Options     |
# | --------- | ---------- | ----------- |
# | item      | references | null: false, foreign_key: true |
# | user      | references | null: false, foreign_key: true |

# ### Association

# - belongs_to :user
# - belongs_to :item
# - has_one :shipping

# ## shippingsテーブル
# | Column           | Type       | Options     |
# | ---------------- | ---------- | ----------- |
# | post_code        | string     | null: false |
# | shipping_area_id | integer    | null: false |
# | city             | string     | null: false |
# | address          | string     | null: false |
# | building         | string     |
# | tel              | string     | null: false |
# | buy              | references | null: false, foreign_key: true |

# ### Association

# - belongs_to :buy
