Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_LOCAL_ID'], ENV['FACEBOOK_LOCAL_SECRET'], {
    callback_url: 'http://localhost:3000/auth/facebook/callback'
  }
end