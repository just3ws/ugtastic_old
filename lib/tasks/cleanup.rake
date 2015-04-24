require 'dotenv/tasks'

namespace :cleanup do
  desc 'Remove the old, common metrics'
  task metrics: %i(dotenv environment) do
    Metric.where(request_user_agent: 'Pingdom.com_bot_version_1.4_(http://www.pingdom.com)').destroy_all
    Metric.where(request_user_agent: 'Site Sensor 1.0').destroy_all
    Metric.where(request_user_agent: 'Spider').destroy_all
    Metric.where(request_user_agent: 'Twitterbot/1.0').destroy_all
    Metric.where(request_user_agent: 'jetmon/1.0 (Jetpack Site Uptime Monitor by WordPress.com)').destroy_all

    %w(
    AhrefsBot Baiduspider CCBot DomainSigmaCrawler DuckDuckGo
    Feedly Googlebot LinkedInBot MJ12bot MegaIndex MetaURI
    NewRelicPinger SeznamBot Sogou StitcherBot Superfeedr
    Swiftbot UniversalFeedParser Yahoo!\ Slurp YandexBot
    bingbot ia_archiver coccoc flipboard spbot Nuzzel
    ShowyouBot FeedBurner Feedfetcher InAGist WebCrawler
    Reeder zitebot Amazon\ CloudFront Exabot Nerdybot
    msnbot TweetmemeBot Pingdom.com_bot_version Mail.RU_Bot
    linkdexbot PaperLiBot Slackbot-LinkExpanding Blekkobot
    WASALive linkfluence LivelapBot
    ).each do |fragment|
      Metric.where('request_user_agent ilike ?', "%#{fragment}%").destroy_all
    end
  end
end
