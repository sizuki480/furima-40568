class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :explanation, null: false 
      t.integer :category_id, null: false 
      t.integer :situation_id, null: false 
      t.integer :shipping_pay_id, null: false 
      t.integer :shipping_area_id, null: false 
      t.integer :shipping_time_id, null: false 
      t.integer :price, null: false 
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
  end
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