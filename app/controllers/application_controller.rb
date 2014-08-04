class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

	  def authentication_required
	  	redirect_to login_path, notice: 'Log In to use Play it by Ear!' if !logged_in?
	  end

	  helper_method def logged_in?
	  	!!current_user
	  end

	  helper_method def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end
end
