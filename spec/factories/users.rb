FactoryGirl.define do
  factory :user do
    name 'Bob'
    sequence(:email){|n| "user#{n}@factory.com"}
    password 'helloworld'
    password_confirmation 'helloworld'
    confirmed_at Time.now
  end
end
