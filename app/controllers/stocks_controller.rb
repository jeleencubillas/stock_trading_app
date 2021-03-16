class StocksController < ApplicationController
  before_action :initialize_new_client
  def index
    @stock = @client.quote()
  end

  def show
    @stock = @client.quote()
  end
end
