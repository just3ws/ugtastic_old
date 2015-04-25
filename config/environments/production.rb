Rails.application.configure do
  config.assets.cache_store = :dalli_store, ENV['MEMCACHEDCLOUD_SERVERS'], {
    namespace: 'ugtastic-assets.cache_store',
    expires_in: 7.days,
    compress: true,
    username: ENV['MEMCACHEDCLOUD_USERNAME'],
    password: ENV['MEMCACHEDCLOUD_PASSWORD']
  }
  config.cache_store = :dalli_store, ENV['MEMCACHEDCLOUD_SERVERS'], {
    namespace: 'ugtastic-cache_store',
    expires_in: 7.days,
    compress: true,
    username: ENV['MEMCACHEDCLOUD_USERNAME'],
    password: ENV['MEMCACHEDCLOUD_PASSWORD']
  }

  config.action_controller.perform_caching = true
  config.action_dispatch.rack_cache = true
  config.active_record.dump_schema_after_migration = false
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.css_compressor = :sass
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.eager_load = true
  config.force_ssl = ENV['FORCE_SSL'].present?
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :debug
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: Rails.application.secrets.domain_name,
    authentication: 'plain',
    enable_starttls_auto: true,
    user_name: Rails.application.secrets.email_provider_username,
    password: Rails.application.secrets.email_provider_password
  }
  config.action_mailer.default_url_options = { host: Rails.application.secrets.domain_name }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.middleware.use(Oink::Middleware, logger: Hodel3000CompliantLogger.new(STDOUT))
end

Rails.logger = Le.new(Rails.application.secrets.le_api_token, ssl: true, tag: true)
