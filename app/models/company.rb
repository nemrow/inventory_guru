include ApplicationHelper

class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :user_companies
  has_many :users, :through => :user_companies
  has_many :suppliers

  def todays_supplier_orders
    suppliers.select do |supplier|
      result = false
      supplier.order_days.each do |order_day|
        result = true if order_day.order_day == "#{Time.now.strftime('%A').downcase}"
      end
      result
    end
  end

  def todays_supplier_deliveries
    suppliers.select do |supplier|
      result = false
      supplier.order_days.each do |order_day|
        p order_day.order_day
        order = day_to_num(order_day.order_day)
        p order
        duration = order_day.delivery_duration
        delivery = num_to_day((order + duration) % 7)
        result = true if delivery == "#{Time.now.strftime('%A').downcase}"
      end
      result
    end
  end

  # def todays_suppliers_orders
  # 	days_suppliers_orders(Time.now.strftime('%A'))
  # end

  # def todays_suppliers_deliveries
  # 	days_suppliers_deliveries(Time.now.strftime('%A'))
  # end

  # def days_suppliers_orders(day_of_week)
  # 	suppliers.joins(:supplier_order_day).where("#{Time.now.strftime('%A')} = true")
  # end

  # def days_suppliers_deliveries(day_of_week)
  # 	suppliers.joins(:supplier_delivery_day).where("#{Time.now.strftime('%A')} = true")
  # end
end
