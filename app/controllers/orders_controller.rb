class OrdersController < ApplicationController
	def index
		@supplier = Supplier.find(params[:supplier_id])
		@products = @supplier.products
	end

	def create
		supplier = Supplier.find(params[:supplier_id])
		supplier.products.each do |product|
			order = Order.find_or_create_by_date_and_product_id(Time.now.beginning_of_day, product.id)
			order.update_attributes(:quantity => params["product_id_#{product.id}"])
			supplier.orders << order
		end
		redirect_to supplier_orders_path(params[:supplier_id])
	end
end