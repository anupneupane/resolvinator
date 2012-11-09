class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    else
      flash.now.alert = "Invalid username. Please try again or click the Signup link below."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
