require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ugtastic
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      # g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # For Foundation 5
    config.assets.precompile += %w( vendor/modernizr )

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # rack-rewrite
    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 '/adam-grandy', '/interviews/windycityrails-2011-adam-grandy'
      r301 '/amitai-schlair', '/interviews/software-craftsmanship-north-america-2013-amitai-schlair'
      r301 '/brad-nunnally', '/interviews/webvisions-2013-brad-nunnally'
      r301 '/brian-ray-chipy-chia', '/interviews/brian-ray'
      r301 '/colin-jones', '/interviews/colin-jones'
      r301 '/corey-haines', '/interviews/corey-haines'
      r301 '/dan-north', '/interviews/dan-north'
      r301 '/david-heinemeier-hansson', '/interviews/railsconf-2014-david-heinemeier-hansson'
      r301 '/dhh', '/interviews/railsconf-2014-david-heinemeier-hansson'
      r301 '/eric-kingery-interview', '/interviews/software-craftsmanship-north-america-2013-eric-kingery'
      r301 '/erik-meijer', '/interviews/goto-conference-2013-erik-meijer'
      r301 '/evan-light', '/interviews/railsconf-2014-evan-light'
      r301 '/interview-amanda-jesse-harlin-okc-js-thunder-plains-techlahoma', '/interviews/amanda-harlin-and-jesse-harlin'
      r301 '/interview-carlos-antonio-da-silva-rails-core-team-member-railsconf-2014', '/interviews/railsconf-2014-carlos-antonio-da-silva'
      r301 '/interview-chad-fowler-founder-rubyconf-railsconf', '/interviews/railsconf-2014-chad-fowler'
      r301 '/interview-charles-nutter-co-lead-jruby-project', '/interviews/charles-nutter-co-lead-of-the-jruby-project'
      r301 '/interview-courtney-hemphill-mixing-lean-agile-development-goto-chicago-2014', '/interviews/goto-conference-2014-courtney-hemphill'
      r301 '/interview-javier-ramirez-presentation-rest-railsconf-2014', '/interviews/railsconf-2014-javier-ramirez'
      r301 '/interview-jez-humble-devops-culture-goto-chicago-2014', '/interviews/goto-conference-2014-jez-humble'
      r301 '/interview-max-de-marzi-organizer-graph-db-chicago-goto-chicago-2014', '/interviews/goto-conference-2014-max-de-marzi'
      r301 '/interview-richard-lee-contributor-openstack-goto-chicago-2014/interview-with-richard-lee-a-contributor-to-openstack-at-goto-chicago-2014', '/interviews/goto-conference-2014-richard-lee'
      r301 '/interview-sean-massa-organizer-geekfest-chicago-node-js-ember-js-user-groups', '/interviews/sean-massa'
      r301 '/interview-vooza-founder-matt-ruby', '/interviews/matt-ruby'
      r301 '/interview-with-fred-guime-organizer-cjug-at-goto-chicago-2014', '/interviews/goto-conference-2014-fred-guime'
      r301 '/interviews/dhh', '/interviews/railsconf-2014-david-heinemeier-hansson'
      r301 '/jim-remsik', '/interviews/windycityrails-2011-jim-remsik'
      r301 '/matt-polito', '/interviews/software-craftsmanship-north-america-2012-matt-polito'
      r301 '/mike-burton', '/interviews/mike-burton'
      r301 '/mike-lee', '/interviews/goto-conference-2015-mike-lee'
      r301 '/mike-miller', '/interviews/goto-conference-2013-mike-miller'
      r301 '/patrick-welsh', '/interviews/software-craftsmanship-north-america-2012-patrick-welsh'
      r301 '/ray-hightower', '/interviews/railsconf-2014-ray-hightower'
      r301 '/rich-hickey', '/interviews/goto-conference-2013-rich-hickey'
      r301 '/ryan-singer', '/interviews/windycityrails-2011-ryan-singer'
      r301 '/sergio-pereira', '/interviews/software-craftsmanship-north-america-2011-sergio-pereira'
      r301 '/wp-content/uploads/2014/11/interview-with-vooza-founder-mat1.jpg', 'https://i.ytimg.com/vi/ABme515DWig/mqdefault.jpg'
    end
  end
end
