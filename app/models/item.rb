class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :situation, :shipping_pay, :shipping_area, :shipping_time

  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :shipping_pay_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_time_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be a number between ¥300 and ¥9,999,999' }
  validates :user, presence: true
  validates :image, presence: true
end

# | name             | string     | null: false |
# | explanation      | text       | null: false |
# | category_id      | integer    | null: false |
# | situation_id     | integer    | null: false |
# | shipping_pay_id  | integer    | null: false |
# | shipping_area_id | integer    | null: false |
# | shipping_time_id | integer    | null: false |
# | price            | integer    | null: false |
# | user             | references | null: false, foreign_key: true |
