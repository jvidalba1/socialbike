OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_APP_ID, TWITTER_APP_SECRET

  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,
           {:client_options => {:ssl => {:ca_file => "#{Rails.root}/config/cert.pem"}}}
end

FACEBOOK_APP_ID = '283614335107965'
FACEBOOK_APP_SECRET = 'f257b87793b99286c8e24b41a8f07622'

TWITTER_APP_ID = 'JW4EffmeGzaHgshYVxxa8A'
TWITTER_APP_SECRET = 'svRlr6VT9dit0IxtyyoOPhW9EhJZoVbrG3ASzTNWDI'

