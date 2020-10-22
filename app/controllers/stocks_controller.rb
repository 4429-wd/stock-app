class StocksController < ApplicationController
  def index
    @stock =Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create 
    @stock = Stock.create(stock_params)
    if @stock.save
      flash[:success] = '入力できました'
        redirect_to root_path
    else
      flash.now[:alert] = '入力できませんでした'
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end
  private

  def stock_params
    params.permit(:item, :stock)
  end
end
