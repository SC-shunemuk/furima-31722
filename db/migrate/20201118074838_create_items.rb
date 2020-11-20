class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,                 null: false
      t.text :content,                null: false
      t.integer :price,               null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :bear_price_id,       null: false
      t.integer :shipping_address_id, null: false
      t.integer :shipping_day_id,     null: false
      t.references :user, foreign_key: true
    end
  end
end
