# Stock Trading App

This app allows users to sign up to purchase stocks listed in the IEX Stock Exchange. User may also sign up for a broker account pending admin approval.

This app uses the iex-ruby-client gem for easy integration of the IEX Finance API with the Ruby on Rails Framework.

## Models
- Admin
- Users (Roles: Buyer, Broker)
- Transaction
- Stock
- BuyersStock

## Features
- Admins can add or remove users from the admin dashboard
- Admins can monitor all transactions between Buyers and Brokers from the admin dashboard
- Brokers can view stock prices and select stocks to sell
- Buyers can view stock prices and select stocks to purchase from brokers