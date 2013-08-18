class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Welcome to Strain Tracker"
    redirect_to trends_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
