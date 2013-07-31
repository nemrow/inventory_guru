class SuppliersController < ApplicationController

	def index
		if current_user && current_company
			@suppliers = current_company.suppliers
		else
			redirect_to root_path
		end
	end

	def new
		@supplier = Supplier.new
		@order_day = OrderDay.create
		@supplier.order_days << @order_day
	end

	def show
		@products = current_company.products
	end

	def create
		supplier = Supplier.create(params[:supplier])
		current_company.suppliers << supplier
		supplier.order_days.each do |order_day|
			order_day.update_attributes(params["order_day_id_#{order_day.id.to_s}"])
		end
		redirect_to supplier_products_path(supplier)
	end

	def edit
		@supplier = Supplier.find(params[:id])
		@order_days = @supplier.order_days
	end

	def update
		supplier = Supplier.find(params[:id])
		supplier.update_attributes(params[:supplier])
		supplier.order_days.each do |order_day|
			order_day.update_attributes(params["order_day_id_#{order_day.id.to_s}"])
		end
		redirect_to suppliers_path
	end
end
