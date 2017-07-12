FactoryGirl.define do
  factory :wiki do
    title "Random Title"
    body "Various random text for body testing."
    private false
    user
  end
end
