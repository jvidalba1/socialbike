OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_APP_ID, TWITTER_APP_SECRET

  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,
           {:client_options => {:ssl => {:ca_file => "#{Rails.root}/config/cert.pem"}}}
end

