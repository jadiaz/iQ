require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :first_name => "HeatSync",
      :last_name  => "Labs",
      :email      => "info@heatsynclabs.org",
      :password   => "test123456",
      :password_confirmation => "test123456"
    }
  end

  describe "data" do
    it { should have_field(:email).of_type(String) }
    it { should have_field(:crypted_password).of_type(String) }
    it { should have_field(:salt).of_type(String) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe "authentication" do

    it "should require an email address" do
      no_email_user = User.new (@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "should reject duplicate emails" do
      User.create!(@attr)
      user2 = User.new(@attr.merge(:username => "example2"))
      user2.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
    it "should reject email address identical up to case" do
      User.create!(@attr)
      user = User.new(@attr.merge(:email => @attr[:email].capitalize))
      user.should_not be_valid
    end

  end
  
end
