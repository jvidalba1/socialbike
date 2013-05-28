OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end

#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :twitter, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET
#end

