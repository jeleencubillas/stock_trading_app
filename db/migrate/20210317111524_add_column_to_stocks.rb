class AddColumnToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :user_id, :integer
    add_column :stocks, :symbol, :string
    add_column :stocks, :opening_price, :integer
    add_column :stocks, :closing_price, :integer
    add_column :stocks, :name, :string
  end
end
