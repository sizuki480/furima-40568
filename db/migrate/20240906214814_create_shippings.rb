class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :post_code
      t.integer :shipping_area_id
      t.string :city
      t.string :address
      t.string :building
      t.string :tel
      t.references :buy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
