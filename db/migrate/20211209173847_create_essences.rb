class CreateEssences < ActiveRecord::Migration[6.1]
  def change
    create_table :essences do |t|
      t.string :name
      t.integer :strength
      t.string :flavor
      t.float :size
      t.string :brand
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
