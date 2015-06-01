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
      r301 '/facebook', 'https://www.facebook.com/UserGroupsFantastic'
      r301 '/twitter',  'https://www.twitter.com/ugtastic'
      r301 '/patreon',  'https://www.patreon.com/ugtastic'
      r301 '/youtube',  'https://www.youtube.com/user/UserGroupsFantastic'

      r301 %r{/adam-grandy(-interview)?(\?.*)?}, '/interviews/windycityrails-2011-adam-grandy$2'
      r301 %r{/amitai-schlair(-interview)?(\?.*)?}, '/interviews/software-craftsmanship-north-america-2013-amitai-schlair$2'
      r301 %r{/bill-scott(-interview)?(\?.*)?}, '/interviews/webvisions-2013-bill-scott$2'
      r301 %r{/brad-nunnally(-interview)?(\?.*)?}, '/interviews/webvisions-2013-brad-nunnally$2'
      r301 %r{/brian-ray-chipy-chia(-interview)?(\?.*)?}, '/interviews/brian-ray$2'
      r301 %r{/chris-whitaker(-interview)?(\?.*)?}, '/interviews/chris-whitaker$2'
      r301 %r{/colin-jones(-interview)?(\?.*)?}, '/interviews/colin-jones$2'
      r301 %r{/corey-haines(-interview)?(\?.*)?}, '/interviews/corey-haines$2'
      r301 %r{/dan-north(-interview)?(\?.*)?}, '/interviews/dan-north$2'
      r301 %r{/david-heinemeier-hansson(-interview)?(\?.*)?}, '/interviews/railsconf-2014-david-heinemeier-hansson$2'
      r301 %r{/dhh(-interview)?(\?.*)?}, '/interviews/railsconf-2014-david-heinemeier-hansson$2'
      r301 %r{/eric-kingery(-interview)?(\?.*)?}, '/interviews/software-craftsmanship-north-america-2013-eric-kingery$2'
      r301 %r{/erik-meijer(-interview)?(\?.*)?}, '/interviews/goto-conference-2013-erik-meijer$2'
      r301 %r{/evan-light(-interview)?(\?.*)?}, '/interviews/railsconf-2014-evan-light$2'
      r301 %r{/interview-amanda-jesse-harlin-okc-js-thunder-plains-techlahoma(-interview)?(\?.*)?}, '/interviews/amanda-harlin-and-jesse-harlin$2'
      r301 %r{/interview-carlos-antonio-da-silva-rails-core-team-member-railsconf-2014(-interview)?(\?.*)?}, '/interviews/railsconf-2014-carlos-antonio-da-silva$2'
      r301 %r{/interview-chad-fowler-founder-rubyconf-railsconf(-interview)?(\?.*)?}, '/interviews/railsconf-2014-chad-fowler$2'
      r301 %r{/interview-charles-nutter-co-lead-jruby-project(-interview)?(\?.*)?}, '/interviews/charles-nutter-co-lead-of-the-jruby-project$2'
      r301 %r{/interview-courtney-hemphill-mixing-lean-agile-development-goto-chicago-2014(-interview)?(\?.*)?}, '/interviews/goto-conference-2014-courtney-hemphill$2'
      r301 %r{/interview-javier-ramirez-presentation-rest-railsconf-2014(-interview)?(\?.*)?}, '/interviews/railsconf-2014-javier-ramirez$2'
      r301 %r{/interview-jez-humble-devops-culture-goto-chicago-2014(-interview)?(\?.*)?}, '/interviews/goto-conference-2014-jez-humble$2'
      r301 %r{/interview-max-de-marzi-organizer-graph-db-chicago-goto-chicago-2014(-interview)?(\?.*)?}, '/interviews/goto-conference-2014-max-de-marzi$2'
      r301 %r{/interview-richard-lee-contributor-openstack-goto-chicago-2014(-interview)?(\?.*)?}, '/interviews/goto-conference-2014-richard-lee$2'
      r301 %r{/interview-sean-massa-organizer-geekfest-chicago-node-js-ember-js-user-groups(-interview)?(\?.*)?}, '/interviews/sean-massa$2'
      r301 %r{/interview-vooza-founder-matt-ruby(-interview)?(\?.*)?}, '/interviews/matt-ruby$2'
      r301 %r{/interview-with-fred-guime-organizer-cjug-at-goto-chicago-2014(-interview)?(\?.*)?}, '/interviews/goto-conference-2014-fred-guime$2'
      r301 %r{/interviews/dhh(-interview)?(\?.*)?}, '/interviews/railsconf-2014-david-heinemeier-hansson$2'
      r301 %r{/jim-remsik(-interview)?(\?.*)?}, '/interviews/windycityrails-2011-jim-remsik$2'
      r301 %r{/joel-clermont(-interview)?(\?.*)?}, '/interviews/joel-clermont$2'
      r301 %r{/mark-simpson(-interview)?(\?.*)?}, '/interviews/mark-simpson$2'
      r301 %r{/matt-polito(-interview)?(\?.*)?}, '/interviews/software-craftsmanship-north-america-2012-matt-polito$2'
      r301 %r{/mike-burton(-interview)?(\?.*)?}, '/interviews/mike-burton$2'
      r301 %r{/mike-lee(-interview)?(\?.*)?}, '/interviews/goto-conference-2015-mike-lee$2'
      r301 %r{/mike-miller(-interview)?(\?.*)?}, '/interviews/goto-conference-2013-mike-miller$2'
      r301 %r{/patrick-welsh(-interview)?(\?.*)?}, '/interviews/software-craftsmanship-north-america-2012-patrick-welsh$2'
      r301 %r{/ray-hightower(-interview)?(\?.*)?}, '/interviews/railsconf-2014-ray-hightower$2'
      r301 %r{/rich-hickey(-interview)?(\?.*)?}, '/interviews/goto-conference-2013-rich-hickey$2'
      r301 %r{/rob-reynolds(-interview)?(\?.*)?}, '/interviews/rob-reynolds$2'
      r301 %r{/ryan-singer(-interview)?(\?.*)?}, '/interviews/windycityrails-2011-ryan-singer$2'
      r301 %r{/sergio-pereira(-interview)?(\?.*)?}, '/interviews/software-craftsmanship-north-america-2011-sergio-pereira$2'
      r301 %r{/shay-howe-and-russ-unger(-interview)?(\?.*)?}, '/interviews/webvisions-2013-russ-unger-and-shay-howe$2'

      r301 '/wp-content/uploads/2014/06/interview-with-rainey-reitman-si.jpg', 'https://i.ytimg.com/vi/NJVMLO96bBo/mqdefault.jp://i.ytimg.com/vi/NJVMLO96bBo/mqdefault.jpg'
      r301 '/wp-content/uploads/2014/07/interview-with-adrian-cockcroft.jpg', 'https://i.ytimg.com/vi/x4q6ZSBRRU8/mqdefault.jp://i.ytimg.com/vi/x4q6ZSBRRU8/mqdefault.jpg'
      r301 '/wp-content/uploads/2014/11/interview-with-vooza-founder-mat1.jpg', 'https://i.ytimg.com/vi/ABme515DWig/mqdefault.jpg'
    end
  end
end
