class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :registered?

  private

    def registered?
      if current_user
        if (current_user.instrument.nil? || current_user.zipcode.empty? || current_user.instrument.name.empty?)
          redirect_to current_user, notice: 'Please update your instrument and zip code.'
        end
      else
        true
      end
    end

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
