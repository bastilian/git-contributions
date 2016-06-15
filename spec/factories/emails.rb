FactoryGirl.define do
  factory :email do
    author
    address Faker::Internet.email
  end
end
