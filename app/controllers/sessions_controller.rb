class SessionsController < ApplicationController

	def create
		auth = request.env["omniauth.auth"]
		binding.pry
		User.self_from_omniauth(auth)
	end
end
