class CreateVapes < ActiveRecord::Migration[6.1]
  def change
    create_table :vapes do |t|
      t.string :name
      t.string :brand
      t.integer :warrancy
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
