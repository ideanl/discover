require 'spec_helper'

def login(user)
  user.save
  visit login_path
  fill_in "Username", with: user.username.upcase
  fill_in "Password", with: user.password
  click_button "Login"
end

describe "Authentication" do

  subject { page }

  describe "Login Page" do
    before { visit login_path }

    it { should have_content("Welcome") }
  end

  context "Login" do
    before { visit login_path }

    describe "with invalid information" do
      before { click_button "Login" }

      it { should have_selector("div.alert.alert-danger", text: "Invalid") }
    end

    describe "with valid information and no redirect page" do
      let(:user) { FactoryGirl.build(:user) }
      before do 
        login(user)
      end

      it { should have_selector("div.alert.alert-success", text: "Login") }
    end
  end

  describe "Logout" do
    let(:user) { FactoryGirl.build(:user) }

    before do
      login(user)
      click_link "Logout"
    end

    it { should have_selector("div.alert.alert-success", text: "You have been logged out") }
  end

  describe "Authorization" do
    describe "for non-signed in users" do
      let(:user) { FactoryGirl.build(:user) }
      
      context "in the feed controller" do
        describe "visiting the feed" do
          before { visit feeds_path }
          it { should have_selector("input.btn.btn-primary") }
        end
      end
    end
  end
end
