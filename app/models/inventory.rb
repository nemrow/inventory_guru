class Inventory < ActiveRecord::Base
  attr_accessible :product_id, :supplier_id, :quantity, :date
  belongs_to :product
  belongs_to :supplier
end
