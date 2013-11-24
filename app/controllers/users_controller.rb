class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "User Successfully Created."
      redirect_to login_path
    else
      flash.now[:danger] = "Could not create user. Error: #{@user.errors.full_messages.join('. ')}"
      render 'new'
    end
  end
end
