class Supplier < ActiveRecord::Base
  attr_accessible :name
  has_one :company
  has_many :products
  has_many :orders
  has_many :inventories
  has_many :order_days
end
