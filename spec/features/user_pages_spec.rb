require 'spec_helper'

describe 'User pages' do
  subject { page }
  
  describe "Signup Page" do 
    before { visit signup_path }

    it { should have_content("Sign Up") }

    let(:submit) { "Sign Up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email", with: "foo@foobar.com"
        fill_in "Username", with: "foobar"
        fill_in "First Name", with: "Foo"
        fill_in "Last Name", with: "Bar"
        fill_in "Password", with: "foobar"
        fill_in "Password Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
