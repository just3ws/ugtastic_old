Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.secrets.omniauth_provider_key,
           Rails.application.secrets.omniauth_provider_secret,
           name: 'google',
           scope: 'http://gdata.youtube.com',
           image_aspect_ratio: 'square',
           image_size: 64
end
