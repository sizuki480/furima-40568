class Item < ApplicationRecord
  # アソシエーション
  has_one_attached :image
  belongs_to :user
  has_one :buy
  # has_many :buys

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :shipping_pay
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_time

  # バリデーション
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_pay_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be a number between ¥300 and ¥9,999,999' }
  validates :image, presence: true
end

# ## itemsテーブル
# | Column           | Type       | Options     |
# | ---------------- | ---------- | ----------- |
# | name             | string     | null: false |
# | explanation      | text       | null: false |
# | category_id      | integer    | null: false |
# | situation_id     | integer    | null: false |
# | shipping_pay_id  | integer    | null: false |
# | shipping_area_id | integer    | null: false |
# | shipping_time_id | integer    | null: false |
# | price            | integer    | null: false |
# | user             | references | null: false, foreign_key: true |

# <!-- ※イメージはActiveStorageで実装するため含まない -->

# ### Association

# - belongs_to :user
# - has_one :buy
