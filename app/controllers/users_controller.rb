class UsersController < ApplicationController
  def new
    unless logged_in?
      @user = User.new
    else
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User Successfully Created."
      redirect_to login_path
    else
      flash.now[:danger] = "Could not create user. Error: #{@user.errors.full_messages.join('. ')}"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :fname, :lname, :password, :password_confirmation)
  end
end
