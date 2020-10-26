class StocksController < ApplicationController
  before_action :login_required

  def index
    @users = User.all
    @stocks =Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create 
    if Stock.create(stock_params)
      redirect_to root_path
    else
      flash.now[:alert] = '必要項目を入力してください'
      render :'new'
    end
  end

  def show
    stocks = stock_url(params[:id])
    @stocks = Stock.all
  end

  def update

  end

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      redirect_to root_path
    end
  end
  private

  def login_required 
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end

  def stock_params
    params.require(:stock).permit(:item,:stock)
  end
end
