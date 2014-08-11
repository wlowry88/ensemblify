OmniAuth.config.logger = Rails.logger	
	if ENV['RAILS_ENV'] == 'production'
		HOST= 'www.ensemblify.com'
		URL = "http://#{HOST}/auth/facebook/callback"
  else
  	HOST= 'localhost:3000'
  	URL = "http://#{HOST}/auth/facebook/callback"
  end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_LOCAL_ID'], ENV['FACEBOOK_LOCAL_SECRET'], {
  	callback_url: URL
  }
end