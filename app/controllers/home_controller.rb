class HomeController < ApplicationController
  layout "signup"
  def index
    if current_user
      redirect_to trends_path
    end
  end
end
