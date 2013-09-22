module ApplicationHelper
  def client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['OMNIAUTH_PROVIDER_KEY']
      config.consumer_secret     = ENV['OMNIAUTH_PROVIDER_SECRET']
      config.access_token         = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret  = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end
