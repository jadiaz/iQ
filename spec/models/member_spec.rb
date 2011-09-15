require 'spec_helper'

describe Member do
  
  before(:each) do
    @attr = {
      :first_name => "HeatSync",
      :last_name  => "Labs",
      :email      => "info@heatsynclabs.org"
    }
  end

  let!(:associate_member) do
    FactoryGirl.create(:associate_member)
  end

  let!(:basic_member) do
    FactoryGirl.create(:basic_member)
  end

  let!(:premium_member) do
    FactoryGirl.create(:premium_member)
  end

  after do
    Member.delete_all
  end

  it { should be_timestamped_document }

  it "should create a new instance given valid attributes" do
    Member.create!(@attr)
  end

  describe "attributes" do
    it { should have_fields(:first_name, :middle_name, :last_name, :company_name) }
    it { should have_fields(:address1, :address2, :city, :state, :zipcode) }
    it { should have_fields(:email, :phone, :website) }
    it { should have_fields(:membership_level, :payment_type, :paypal_id, :access_id) }

    it { should have_field(:active).of_type(Boolean).with_default_value_of(true) }
    it { should have_field(:board_of_directors).of_type(Boolean).with_default_value_of(false) }
    it { should have_field(:operations).of_type(Boolean).with_default_value_of(false) }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_acceptance_of :terms }
  end

  describe "relations" do
    it { should embed_many(:interests) }
    it { should embed_many(:payments) }
  end

  describe "scopes" do
    it "should return a document for associate members" do
      Member.associate_members.first.should == associate_member
    end

    it "should return a document for basic members" do
      Member.basic_members.first.should == basic_member
    end

    it "should return a document for premier members" do
      Member.premium_members.first.should == premium_member
    end

    it "should return a document for an active user" do
      Member.active.first.active.should == true
    end

  end

end
