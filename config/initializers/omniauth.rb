Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET
end

