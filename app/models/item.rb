class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :situation, :shipping_pay, :shipping_area, :shipping_time

  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

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
