include ApplicationHelper

class OrderDay < ActiveRecord::Base
  attr_accessible :company_id, :order_day, :delivery_duration
  belongs_to :supplier

  # day order will be delivered
  def delivery_day
  	num_to_day((day_to_num(self.order_day) + delivery_duration) % 7)
  end

  # gives all days in transit excluding order and deliver days
  def in_transit_days
  	result = []
  	delivery_duration.times do |num|
      active_day = num_to_day((day_to_num(self.order_day) + num) % 7)
  		result << active_day if active_day != self.order_day && active_day != self.delivery_day
  	end
  	result
  end
end
