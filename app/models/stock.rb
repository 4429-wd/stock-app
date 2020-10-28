class Stock < ApplicationRecord
  belongs_to :users, optional: true

  def stock_total
    count + shipment
  end
end
