class Transaction < ApplicationRecord
    validates :user_id, :stock_id, :broker_id, :stock_sale_price, :units, :price, presence: true
end
