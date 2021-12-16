class CreateAccessories < ActiveRecord::Migration[6.1]
  def change
    create_table :accessories do |t|
      t.string :name
      t.float :price
      t.string :brand
      t.integer :quantity
      t.integer :vape_id
      t.timestamps
    end
  end
end
