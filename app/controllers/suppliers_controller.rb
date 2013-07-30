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
	end

	def show
		@products = current_company.products
	end

	def create
		supplier = Supplier.create(params[:supplier])
		delivery_days = SupplierDeliveryDay.create(params[:supplier_delivery_day])
		order_days = SupplierOrderDay.create(params[:supplier_order_day])
		current_company.suppliers << supplier
		supplier.supplier_delivery_day = delivery_days
		supplier.supplier_order_day = order_days
		redirect_to supplier_products_path(supplier)
	end

	def edit
		@supplier = Supplier.find(params[:id])
		@order_days = @supplier.order_days
	end

	def update
		supplier = Supplier.find(params[:id])
		supplier.update_attributes(params[:supplier])
		supplier.supplier_order_days.each do |order_day|
			order_day.update_attributes(params[order_day.to_s+order_day.id.to_s])
		end
		redirect_to suppliers_path
	end
end
