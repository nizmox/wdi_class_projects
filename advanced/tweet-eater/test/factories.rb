FactoryGirl.define do
  
  #define a factory to generate a test user
  factory :user do |f|
    #generate a unique username with test1, test2, test3 etc...
    f.sequence(:name) { Faker::Name.name }
    #generate a new email address using the name above
    f.sequence(:email) { |n| "test#{n}@test.com"}
    
    #because this is nested, it will first generate a user
    factory :user_with_tweets do
      after(:create) do |u|
        FactoryGirl.create_list(:tweet, Random.rand(10..50), :user => u)
      end
    end
  end

  factory :tweet do |f|
    f.sequence(:post) { Faker::Lorem.sentence }
  end

end

#you can then generate a user using "FactoryGirl.create(:user)"
#or create 10 users using "FactoryGirl.create_list(:user,10)"
#to create users with tweets use "FactoryGirl.create(:user_with_tweets)"