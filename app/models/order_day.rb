class OrderDay < ActiveRecord::Base
  attr_accessible :company_id, :order_day, :delivery_duration
  belongs_to :supplier
end
