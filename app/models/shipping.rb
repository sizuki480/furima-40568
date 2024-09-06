class Shipping < ApplicationRecord
  belongs_to :buy
end

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
