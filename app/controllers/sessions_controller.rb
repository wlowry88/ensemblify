class SessionsController < ApplicationController
	skip_before_action :registered?

	def create
		auth = request.env["omniauth.auth"]
		@user = User.from_omniauth(auth)
		session[:user_id]= @user.id 
		if @user.check_for_instrument_and_zipcode
			redirect_to groups_path
		else
			redirect_to @user 
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end
end
