class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:email])
      
    else
    
    end
  end

  def destroy

  end
end
