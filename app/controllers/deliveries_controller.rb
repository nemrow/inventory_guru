class DeliveriesController < ApplicationController
	def index
		@supplier = Supplier.find(params[:supplier_id])
		@orders = @supplier.todays_deliveries
	end
end
