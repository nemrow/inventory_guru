class SupplierOrderDaysController < ApplicationController
	
	def create
		@order_day = SupplierOrderDay.create
		p @order_day
		render partial: 'supplier_order_days/order_days'
	end

	def update

	end
end
