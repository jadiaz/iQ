require 'spec_helper'

describe "Home page" do

  before do
    @user = FactoryGirl.create(:valid_user)
  end

  before(:each) do
    visit root_path
  end
  
  it "should respond with the site is visited" do
    current_path.should eql(root_path)
  end

  it "should display HSL - iQ as title" do
    find('title').should have_content('iQ')
  end

  describe "sign in" do

    after(:each) do
      visit sign_out_path
    end

    it "should display sign_in link if not logged in"

    it "should display sign_out link if logged in" do
      find('nav').click_link('sign in')
      current_path.should eql(sign_in_path)

      within("form#login") do
        fill_in('email', :with => @user.email)
        fill_in('password', :with => @user.password)
        #check('Remember me')
        click_button('sign in')
      end

      current_path.should eql(root_path)
      find('p#notice').should have_link('sign out')
    end

    it "should allow a member to sign in" do
      find('nav').click_link('sign in')
      current_path.should eql(sign_in_path)

      within("form#login") do
        fill_in('email', :with => @user.email)
        fill_in('password', :with => @user.password )
        #check('Remember me')
        click_button('sign in')
      end

      current_path.should eql(root_path)
      page.should have_content('Sign in successfull.')
    end
  end

end
