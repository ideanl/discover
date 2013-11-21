class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(email: params[:session][:email].downcase)
  end

  def destroy

  end
end
