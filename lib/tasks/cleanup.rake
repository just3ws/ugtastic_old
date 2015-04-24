require 'dotenv/tasks'

namespace :cleanup do
  desc 'Remove the old, common metrics'
  task metrics: %i(dotenv environment) do

    Metric.
      where(request_user_agent: 'Pingdom.com_bot_version_1.4_(http://www.pingdom.com)').
      where(request_user_agent: 'NewRelicPinger/1.0 (935497)').
      where(request_user_agent: 'Site Sensor 1.0').
      where(request_user_agent: 'Spider').
      where(request_user_agent: 'jetmon/1.0 (Jetpack Site Uptime Monitor by WordPress.com)').
      where(request_user_agent: 'Twitterbot/1.0').
      destroy_all
  end
end
