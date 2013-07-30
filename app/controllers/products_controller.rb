class ProductsController < ApplicationController
	def index
		@supplier = Supplier.find(params[:supplier_id])
		@products = @supplier.products
	end

	def new
		@product = Product.new
	end

	def create
		p params
		supplier = Supplier.find(params[:supplier_id])
		product = Product.new(params[:product])
		if product.save
			supplier.products << product
			redirect_to supplier_products_path(supplier)
		else
			redirect_to root_path
		end
	end	
end
