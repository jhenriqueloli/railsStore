class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.float :amount
      t.timestamps
    end
  end
end
