require 'spec_helper'

describe User do
  context 'when signing up' do
    before (:each) { @user = FactoryGirl.build(:user) } 

    subject { @user } 

    describe 'when email is not present' do
      before { @user.email = '' }
      it { should_not be_valid }
    end
    
    describe 'when username is not present' do
      before { @user.username = '' }
      it { should_not be_valid }
    end
    
    describe 'when first name is not present' do
      before { @user.fname = '' }
      it { should_not be_valid }
    end
    
    describe 'when last name is not present' do
      before { @user.lname = '' }
      it { should_not be_valid }
    end
    
    describe 'when password is not present' do
      before do 
        @user.password = ''
        @user.password_confirmation = ''
      end

      it { should_not be_valid }
    end
    
    describe "when password confirmation doesn't match confirmation " do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end




    describe 'when username is too long' do
      before { @user.username = 'a'*51 }
      it { should_not be_valid }
    end

    describe 'when email is too long' do
      before { @user.email = 'a'*51 }
      it { should_not be_valid }
    end

    describe 'when first name is too long' do
      before { @user.username = 'a'*51 }
      it { should_not be_valid }
    end

    describe 'when last name is too long' do
      before { @user.username = 'a'*51 }
      it { should_not be_valid }
    end
    
    describe 'when email format is invalid' do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid|
          @user.email = invalid
          expect(@user).not_to be_valid
        end
      end
    end

    describe 'when email format is valid' do
      it "should be valid" do 
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid|
          @user.email = valid
          expect(@user).to be_valid
        end
      end
    end

    describe 'when email address or username is already taken' do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.downcase
        user_with_same_email.username = @user.email.downcase
        user_with_same_email.save
      end

      it { should_not be_valid }
    end

    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by(email: @user.email) }

      describe "with valid password" do
        it { should eq found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }

        it { should_not eq user_for_invalid_password }
        specify { expect(user_for_invalid_password).to be_false }
      end
    end

    describe "with a password that is too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
  end
end
