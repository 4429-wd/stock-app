class StocksController < ApplicationController
  before_action :login_required

  def index
    @stock =Stock.all
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

  def update
  end

  def destroy
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
