class Stock < ApplicationRecord
  belongs_to :users, optional: true
  
  Stock.sum(:count)
end
