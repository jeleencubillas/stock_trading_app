class StocksController < ApplicationController
  before_action :initialize_new_client
  def index
    @crypto = @client.crypto
  end

  def show
    
  end

  def search
    @user = current_user
    if crypto_params.present?
      @stock = @client.crypto(crypto_params)
      @stocks_from_db = Stock.where(symbol: crypto_params)
    end
  end

  def new
    @stock = Stock.new
    @user = current_user
  end

  def create
    @stock = Stock.new
    @stock.symbol = params[:symbol]
    @stock.opening_price = params[:price]
    @stock.user_id = current_user.id
    if @stock.save
      flash[:notice] = 'Stock has been added!'
      redirect_to stocks_search_path
    else
      render :search
    end
  end

  private
  def crypto_params
    params[:query]
  end
end
