class StocksController < ApplicationController
  before_action :login_required
  before_action :authenticate_user!

  def index
    @users = User.all
    @stocks =Stock.all
  end
  
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to root_path
      return
    else
      flash.now[:alert] = '追加できませんでした'
      render :new
    end
  end

  def show
    stocks = stock_url(params[:id])
    @stocks = Stock.all
  end


  def edit
    @stocks = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stocs
      redirect_to root_path
      return
    else
      flash.now[:alert] = '追加できませんでした'
      render :edit 
    end
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
    params.require(:stock).permit(:name,:count)
  end

  def total_params
    params.permit(:count)
  end

end
