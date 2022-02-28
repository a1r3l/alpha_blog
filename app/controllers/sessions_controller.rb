class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully"
      redirect_to user
    else
      flash.now[:alert] = "There were something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    flash[:notice] = "Logged Out"
    session[:user_id] = nil
    redirect_to root_path
  end
end