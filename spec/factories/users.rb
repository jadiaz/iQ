require 'factory_girl'

FactoryGirl.define do
  factory :valid_user do
    email     "test.user@heatsynclabs.org"
    password  "test123456"
  end
end
