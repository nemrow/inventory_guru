class Inventory < ActiveRecord::Base
  attr_accessible :procuct_id, :supplier_id, :quantity
  belongs_to :product
  belongs_to :supplier
end
