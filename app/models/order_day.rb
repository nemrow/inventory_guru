include ApplicationHelper

class OrderDay < ActiveRecord::Base
  attr_accessible :company_id, :order_day, :delivery_duration
  belongs_to :supplier

  def delivery_day
  	num_to_day((day_to_num(self.order_day) + delivery_duration) % 7)
  end
end
