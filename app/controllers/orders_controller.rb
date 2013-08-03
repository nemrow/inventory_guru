class OrdersController < ApplicationController
	def index
		@supplier = Supplier.find(params[:supplier_id])
		@products = @supplier.products
		transit_days = []

		# get this suppliers transit days
		@supplier.order_days.each do |order_day|
		 transit_days << order_day.in_transit_days
		end

		# see if today is a transit day for this supplier
		if transit_days.flatten.include?("#{Time.now.strftime('%A').downcase}")
			@is_transit_day = true
		else
			@is_transit_day = false
		end

	end

	def create
		supplier = Supplier.find(params[:supplier_id])
		supplier.products.each do |product|
			order = Order.find_or_create_by_date_and_product_id(date_format(Time.now), product.id)
			order.update_attributes(:quantity => params["product_id_#{product.id}"])
			supplier.orders << order
		end
		redirect_to supplier_orders_path(params[:supplier_id])
	end
end