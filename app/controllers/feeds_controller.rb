class FeedsController < ApplicationController
  before_action :signed_in_user

  def show

  end

  private

  def signed_in_user
    if !logged_in?
      require_login
      flash[:warning] = "Please sign in"
      redirect_to login_path unless logged_in?
    end
  end
end
