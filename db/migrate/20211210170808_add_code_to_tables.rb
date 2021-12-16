class AddCodeToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :vapes,      :code, :string
    add_column :essences,   :code, :string
    add_column :accessories,:code, :string
  end
end
