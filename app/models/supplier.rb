class Supplier < ActiveRecord::Base
  attr_accessible :name
  belongs_to :company
  has_many :products
  has_many :orders
  has_many :inventories
  has_many :order_days

  def todays_deliveries
  	order_date = []
  	deliveries = []
  	order_days.each do |order_day|
  		if delivery_day_today?(order_day)
  			order_date << date_format(Time.now - (order_day.delivery_duration).days)
  		end
  	end
  	order_date.each do |order_date|
  		orders.each do |order|
  			deliveries << order if date_format(order.date) == date_format(order_date)
  		end
  	end
  	deliveries
  end

  private
  
  def delivery_day_today?(order_day)
  	order_day.delivery_day == "#{Time.now.strftime('%A').downcase}"
  end
end
