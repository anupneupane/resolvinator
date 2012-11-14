class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to sign_in_path, notice: "You've signed up!"
    else
      render "new"
    end
  end
end
