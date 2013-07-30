class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.new(params[:user])
		if user.save
			session[:user_id] = user.id 
			redirect_to user_path(:user)
		else
			@errors = "could not create user"
			redirect_to root_path
		end
	end

	def show
		if current_user.companies.count < 1
			redirect_to new_company_path
		else
			session[:company_id] = current_user.companies.first.id
			redirect_to company_path(current_user.companies.first)
		end
	end
end
