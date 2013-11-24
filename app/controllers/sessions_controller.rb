class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:password])
      @user = login(@user.username, params[:password]) if @user
      flash[:success] = "Login Successful"
      redirect_back_or_to feeds_path
    else
      flash.now[:danger] = "Invalid Username or Password"
      render 'new'
    end
  end

  def destroy
    if logged_in?
      @current_user = nil
      params[:s
  end
end
