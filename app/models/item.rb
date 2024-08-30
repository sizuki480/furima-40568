class Item < ApplicationRecord
  has_one_attached :image

  # | name             | string     | null: false |
  # | explanation      | text       | null: false |
  # | category_id      | integer    | null: false |
  # | situation_id     | integer    | null: false |
  # | shipping_pay_id  | integer    | null: false |
  # | shipping_area_id | integer    | null: false |
  # | shipping_time_id | integer    | null: false |
  # | price            | integer    | null: false |
  # | user             | references | null: false, foreign_key: true |
end
