class Buy < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :shipping
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
