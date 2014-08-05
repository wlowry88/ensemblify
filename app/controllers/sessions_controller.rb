class SessionsController < ApplicationController

	def create
		auth = request.env["omniauth.auth"]
		@user = User.from_omniauth(auth)
		session[:user_id]= @user.id 
		if @user.registered?
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
