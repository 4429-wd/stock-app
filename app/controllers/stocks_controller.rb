class StocksController < ApplicationController
  def index
    @stock =Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create 
    @stock = Stock.new(stock_params)
    if @stock.save
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

  def stock_params
    params.require(:stock).permit(:item,:stock)
  end
end
