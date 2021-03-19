class AddColumnsToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :user_id, :integer
    add_column :transactions, :stock_id, :integer
    add_column :transactions, :broker_id, :integer
    add_column :transactions, :stock_sale_price, :integer
    add_column :transactions, :units, :integer
    add_column :transactions, :price, :integer
  end
end
