require 'spec_helper'

describe "iQ root page" do

  before do
    visit sign_out_path
  end

  it "should require authentication first" do
    visit iq_root_path
    current_path.should eql(sign_in_path)
  end
end
