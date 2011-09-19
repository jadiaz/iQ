require 'factory_girl'

FactoryGirl.define do
  factory :valid_user, :class => User do
    email     "test.user@heatsynclabs.org"
    password  "test123456"
    password_confirmation "test123456"
  end
end
