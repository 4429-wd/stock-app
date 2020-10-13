class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new
  end

  def create
    Stock.all
  end

  private
  def count_params
    prams.permit(:count)
  end
end
