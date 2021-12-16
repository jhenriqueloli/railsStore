class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.string  :product_code
      t.timestamps
    end
  end
end
