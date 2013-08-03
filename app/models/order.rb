include ApplicationHelper

class Order < ActiveRecord::Base
  attr_accessible :company_id, :date, :delivery_date, :product_id, :quantity
 	belongs_to :product
 	belongs_to :company
 	belongs_to :supplier
 	before_save :get_delivery_date

 	def get_delivery_date
 		order_day_object = self.product.supplier.order_days.find_by_order_day("#{Time.now.strftime('%A').downcase}")
 		if order_day_object
	 		delivery_duration = order_day_object.delivery_duration
	 		self.delivery_date = date_format(Time.now + delivery_duration.days)
	 	end
 	end

 	def self.get_in_transit_quantity(product, date)
 		where("product_id = #{product.id} AND delivery_date > '#{date}' AND date < '#{date}'").sum('quantity')
 	end
end
