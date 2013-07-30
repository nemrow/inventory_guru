class InventoryController < ApplicationController
	def index
		@supplier = Supplier.find(params[:supplier_id])
		@all_suppliers = current_company.suppliers
		@products = @supplier.products
	end

	def create
		supplier = Supplier.find(params[:supplier_id])
		supplier.products.each do |product|
			inventory = Inventory.find_or_create_by_date_and_product_id(Time.now.beginning_of_day, product.id)
			inventory.update_attributes(:quantity => params["product_id_#{product.id}"])
			supplier.inventories << inventory
		end
		redirect_to supplier_inventory_index_path(params[:supplier_id])
	end

	def update

	end
end