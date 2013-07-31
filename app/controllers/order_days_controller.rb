class OrderDaysController < ApplicationController
	
	def create
		@supplier = Supplier.find(params[:supplier_id])
		@order_day = OrderDay.create
		@supplier.order_days << @order_day
		render partial: 'order_days/order_days', :locals => {:order_day => @order_day}
	end

	def destroy
		order_day = OrderDay.find(params[:id])
		order_day.destroy
		render nothing: true
	end
end
