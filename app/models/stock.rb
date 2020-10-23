class Stock < ApplicationRecord
  belongs_to :users
  validates :item, :stock, presence: true 
end
