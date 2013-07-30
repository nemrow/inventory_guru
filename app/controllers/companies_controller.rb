class CompaniesController < ApplicationController
	def show
		if current_company
			@company = Company.find(current_company)
			@suppliers_orders = @company.todays_supplier_orders
			@suppliers_deliveries = @company.todays_supplier_deliveries
		else
			redirect_to new_company_path
		end
	end

	def new
		@company = Company.new
	end

	def create
		company = Company.new(params[:company])
		if company.save
			current_user.companies << company
			session[:company_id] = company.id
			redirect_to company_path(company)
		else
			@errors = "could not create company"
			redirect_to new_company_path
		end
	end
end
