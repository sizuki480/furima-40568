class BuyShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :shipping_area_id, :city, :address, :building, :tel, :buy_id, :token

  # バリデーション
  with_options presence: true do
    validates :item_id # belongs_toの置き換え
    validates :user_id # belongs_toの置き換え
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Must be 10 or 11 digits' }
    validates :token
  end


  # 保存処理
  def save
    # 購入情報を保存し、変数buyに代入する
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Shipping.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, tel: tel, buy_id: buy.id)
  end
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