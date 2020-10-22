class Stock < ApplicationRecord
  belongs_to :users,optional: true
  validates :item, :stock, presence: true 
end
