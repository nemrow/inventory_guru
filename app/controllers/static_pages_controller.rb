class StaticPagesController < ApplicationController
  def index
  	if current_user
  		redirect_to user_path(current_user)
  	else
	  	@user = User.new
	  end
  end
end
