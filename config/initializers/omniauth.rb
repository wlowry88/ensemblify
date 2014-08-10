Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_LOCAL_ID'], ENV['FACEBOOK_LOCAL_SECRET'], {
  	if ENV['RAILS_ENV'] == 'production'
  		callback_url: 'http://ensemblify.herokuapp.com/auth/facebook/callback'
    else
    	callback_url: 'http://localhost:3000/auth/facebook/callback'
    end
  }
end