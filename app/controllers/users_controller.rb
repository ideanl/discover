class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to feeds_path
    else
      flash[:danger] = "Could not create user. Error: #{@user.errors.full_messages.join('. ')}"
      render 'new'
    end
  end
end
