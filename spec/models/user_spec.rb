require 'spec_helper'

describe User do
  context 'when signing up' do
    before (:all) { @user = FactoryGirl.build(:user) } 
    it 'blank email' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end
