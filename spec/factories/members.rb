require 'factory_girl'

FactoryGirl.define do
  factory :associate_member, :class => Member do
    first_name        "Student"
    last_name         "Member"
    email             "student.member@heatsynclabs.org"
    membership_level  "Associate"
    active            true
  end

  factory :basic_member, :class => Member do
    first_name        "Basic"
    last_name         "Member"
    email             "basic.member@heatsynclabs.org"
    membership_level  "Basic"
    active            true
  end

  factory :premium_member, :class => Member do
    first_name        "Premium"
    last_name         "Member"
    email             "premium.member@heatsynclabs.org"
    membership_level  "Premium"
    active            true
  end
end
