class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(user_params)

    if @Transaction.save
      redirect_to transactions_path, notice: "New Transaction created"
    else
      render :new
    end

  private
    def user_params
      params.require(:transaction).permit(:user_id, :broker_id, :stock_id)
    end

end
