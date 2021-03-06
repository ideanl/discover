class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      @user = login(@user) if @user
      flash[:success] = "Login Successful"
      redirect_back_or_to feeds_path
    else
      flash.now[:danger] = "Invalid Username or Password"
      render 'new'
    end
  end

  def destroy
    @current_user = nil
    session.clear
    flash[:success] = "You have been logged out"
    redirect_to login_path
  end
end
