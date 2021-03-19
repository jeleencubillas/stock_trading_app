class Stock < ApplicationRecord
  belongs_to :user

  def self.get_brokers_crypto(symbol)
    query = <<~SQL
       select stocks.id, stocks.opening_price, stocks.symbol, users.first_name from stocks, users where users.role = 1 and stocks.symbol = "#{symbol}" and stocks.user_id = users.id
    SQL
    records = ActiveRecord::Base.connection.execute(query).to_a
  end

end
