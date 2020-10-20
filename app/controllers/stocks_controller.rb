class StocksController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  private
  def count_params
    prams.permit(:count)
  end
end
