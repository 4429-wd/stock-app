class Count < ActiveRecord::Basel
  belong_to :stock

  def self_total
    stock.count + stock.shipment.to_i
  end

end