class TransactionsController < ApplicationController

  def index
    @transactions = current_user.transactions.all
    @transactions_all = Transaction.all
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  def new
    @transaction = current_user.transactions.build
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.user_id = current_user.id
    @stock = params[:stock_id]
    @transaction.stock_id = @stock.id
    @transaction.broker_id = @stock.user_id
    @transaction.stock_sale_price = @stock.opening_price

    if @Transaction.save
      redirect_to transactions_path, notice: "New Transaction created"
    else
      render :new
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:stock_sale_price, :units, :price)
    end

end
