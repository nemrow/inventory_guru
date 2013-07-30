class Order < ActiveRecord::Base
  attr_accessible :company_id, :date, :product_id, :quantity
 	belongs_to :product
 	belongs_to :company
 	belongs_to :supplier
end
