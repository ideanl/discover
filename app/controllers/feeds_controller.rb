class FeedsController < ApplicationController
  before_action :signed_in_user

  def show

  end

  private

  def signed_in_user
    if !logged_in?
      require_login
      redirect_to login_path
    end
  end
end
