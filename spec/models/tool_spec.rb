require 'spec_helper'

describe Tool do
  
  let!(:current_user) do
    FactoryGirl.create(:user)
  end

  before(:each) do
    @attr = FactoryGirl.attributes_for(:tool)
  end

  after do
    Tool.delete_all
  end

  describe "attributes" do
    it { should have_field(:name) }
    it { should have_field(:identification_number) }
    it { should have_field(:description) }
    it { should have_field(:location) }
    it { should have_field(:status) }

    it { should have_field(:owned_by) }
    it { should have_field(:borrowed_by) }
    it { should have_field(:borrowed_on).of_type(Date) }
    it { should have_field(:removed_on).of_type(DateTime) }

    it { should be_timestamped_document }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    #it { should embed_many(:categories) }
    #it { should embed_many(:attachments) }
    #it { should embed_many(:images) }
  end

  describe "scopes" do
  end

  describe "methods" do
  end

  context "when attributes are valid" do
    it "should create a new instance" do
      Tool.create!(@attr)
    end    
  end

end
require 'spec_helper'

describe Tool do
  pending "add some examples to (or delete) #{__FILE__}"
end
