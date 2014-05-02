namespace :twitter do

  # Empty our User and Tweet tables -- a simple rake task using our rails app's models
  desc "Clear User and Tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  desc "Create dummy Twitter posts and users"
  #expecting something called "user count" and it will be available in the "args" array ("t" will represent posts)
  task :posts, [:user_count] => :environment do |t, args|
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end

  # Using the Twitter API and oauth params we can search Twitter and save our results to our database
  # Accepts 2 parameters: search query and number of desired results
  desc "Search Twitter for a query and number of results"
  task :search, [:query, :limit] => :environment do |t, args|

    #set query variables
    query = args[:query]
    limit = args[:limit].to_i

    puts "Searching for #{query}, limiting to #{limit} results. Please wait..."

    #setup authentication for API call
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end

    #perform query
    tweets = client.search(query, :result_type => "recent").take(limit)

    #
    tweets.collect do |tweet|
      find_user = User.where('twitter_id = ?', tweet.user.id)

      if find_user.length == 0
        user = User.create(:twitter_id => tweet.user.id, :name => tweet.user.screen_name)
        puts "User Created: #{tweet.user.screen_name}"
      else
        puts "WARNING: User with twitter id #{tweet.user.id} already exists in database"
        user = find_user.first
      end

      find_tweet = Tweet.where('twitter_id = ?', tweet.id)

      if find_tweet.length == 0
        user.tweets.create(:twitter_id => tweet.id, :post => tweet.text)
        puts "Tweet Created: #{tweet.text}"
      else
        puts "WARNING: Tweet with twitter id #{tweet.id} already exists in database"
      end
      
    end

    puts "TWEETS FETCHED: #{tweets.count}"

  end
end