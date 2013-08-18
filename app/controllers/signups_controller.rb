class SignupsController < ApplicationController
  layout "signup"

  def index
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(params[:signup])
    if @signup.save
      flash[:notice] = "Thanks for signing up. Well let you know as soon as we are ready!"
      redirect_to signups_path
    else
      flash[:alert] = "Oops! Something went wrong while signing up. Please try again."
      render "index"
    end
  end
end
