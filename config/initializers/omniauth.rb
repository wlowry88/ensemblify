OmniAuth.config.logger = Rails.logger	
	if ENV['RAILS_ENV'] == 'production'
		HOST= 'www.ensemblify.com'
  else
  	HOST= 'localhost:3000'
  end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_LOCAL_ID'], ENV['FACEBOOK_LOCAL_SECRET'], {
  	callback_url: "http://#{HOST}/auth/facebook/callback"
  }
end