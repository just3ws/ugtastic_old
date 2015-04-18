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
      # r301 '/sandro-mancuso-interview-3',
      # r301 '/charley-baker',
      # r301 '/interview-cindy-sprague-lead-organizer-goto-chicago-2014',
      # r301 '/interviews/it-s-technically-everyone-s-tech-community',
      # r301 '/interviews/fest-of-geeks',
      # r301 '/interviews/coding-in-the-great-outdoors',
      # r301 '/interviews/tech-community-in-denver-boulder',
      # r301 '/interviews/from-the-people-that-helped-make-the-web-open-mozilla-might-do-the-same-for-mobile-phones',
      # r301 '/interviews/getting-chippy-with-chipy',
      # r301 '/interviews/the-digital-natives-are-restless',
      # r301 '/interviews/railers-gone-mad-in-madison',
      # r301 '/interviews/lights-camera-windycityrails',
      # r301 '/conferences/software-craftsmanship-north-america-2011-interviews',
      # r301 '/interviews/scott-seely-runs-a-net-users-group-up-in',
      # r301 '/sean-massa-and-todd-larsen-528',
      # r301 '/conferences/software-craftsmanship-north-america-2012-interviews',
      # r301 '/interviews/from-java-to-ruby-and-the-communities-that-bind-them',
      # r301 '/interviews/dc-net',
      # r301 '/interviews/chi-town-craftsmanship',
      # r301 '/interviews/midwestern-and-east-coast-ruby-community',
      # r301 '/shirley-bailes-interview',
      # r301 '/interviews/teacher',
      # r301 '/erik-meijer-1322',
      # r301 '/interviews/welcome-to-the-user-group-industry-you-re-going-to-have-a-good-time',
      # r301 '/sergio-pereira-563',
      # r301 '/interviews/foss-contributor',
      # r301 '/mark-simpson-1888',
      # r301 '/interviews/a-designer-perspective-for-a-developer-community',
      # r301 '/interviews/just-in-love-with-ruby-javascript',
      # r301 '/interviews/net-in-the-top-left-corner-of-the-usa',
      # r301 '/interviews/chicago-big-shoulders-big-data',
      # r301 '/interviews/get-a-masters-in-software-craftsmanship-at-8th-light-university',
      # r301 '/interviews/sc-tampa',
      # r301 '/interviews/i-can-t-imaging-a-chicago-ruby-scene-without-ray-bringing-it-all-together',
      # r301 '/interviews/active-java',
      # r301 '/charley-barker',
      # r301 '/interviews/koans',
      # r301 '/groups/london-software-craftsmanship',
      # r301 '/robert-martin-511',
      # r301 '/interviews/multimedia-teaching',
      # r301 '/desi-mcadam-and-sarah-allen-499',
      # r301 '/interview-vooza-founder-matt-ruby/-',
      # r301 '/tim-murphy-498',
      # r301 '/dean-wampler-1016',
      # r301 '/mike-clement-501',
      # r301 '/interviews/learning-about-interviewing',
      # r301 '/kumar-mcmillan-524',
      # r301 '/aaron-bedra-516',
      # r301 '/eric-macadie-537',
      # r301 '/getting-back-on-the-bike-or-horse-whichever-m',
      # r301 '/charley-baker-562',
      # r301 '/post/13084904618/zach-and-i-first-met-at-software-craftsmanship',
      # r301 '/learning-moment-and-empathizing-with-new-lear',
      # r301 '/melissa-castello',
      # r301 '/interviews/destroy-all-bad-programming',
      # r301 '/post/19498921659/scott-seely-runs-a-net-users-group-up-in',
      # r301 '/evan-light/Coding',

      # rewrite   '/wiki/John_Trupiano',  '/john'
      # r301      '/wiki/Yair_Flicker',   '/yair'
      # r302      '/wiki/Greg_Jastrab',   '/greg'
      # r301      %r{/wiki/(\w+)_\w+},    '/$1'
    end
  end
end
