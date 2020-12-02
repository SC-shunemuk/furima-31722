class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_code,    null:false
      t.integer :prefecture_id,  null:false
      t.string :city,            null:false
      t.string :address_number,  null:false
      t.string :house_name,      null:false
      t.string :tel,             null:false, unique:true
      t.references :purchase,    foreign_key:true
      t.timestamps
    end
  end
end
