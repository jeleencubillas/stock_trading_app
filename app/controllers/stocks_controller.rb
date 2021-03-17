class StocksController < ApplicationController
  before_action :initialize_new_client
  def index
    @stocks = @client.crypto
  end

  def show
  end

  def search
    @stock = @client.crypto(params[:query])
    render "stocks/show"
  end

  private
  def crypto_params
    params[:query]
  end
end
