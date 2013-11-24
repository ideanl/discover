require 'spec_helper'

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
        user.save
        fill_in "Username", with: user.username.upcase
        fill_in "Password", with: user.password
        click_button "Login"
      end
    end
  end
end
