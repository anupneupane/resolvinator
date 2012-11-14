class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  helper_method :current_user
  helper_method :authorized?

  private

    def authorize
      redirect_to sign_in_url, alert: "You must be signed in for that!" unless authorized?

    end

    def authorized?
      true if current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


end
