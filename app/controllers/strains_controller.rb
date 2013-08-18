class StrainsController < ApplicationController
  def index
    @strains = Strain.all
    respond_to do |format|
      format.html
      format.json { render json: @strains }
    end
  end

  def show
    @strain = Strain.find(params[:id])
    @smokein = Smokein.new
  end

  def search
    @strains = Strain.find_by_fuzzy_name(params[:s], :limit => 5)
    render json: @strains
  end

  def smokein
    @smokein = Smokein.new(params[:smokein])
    if @smokein.save
      flash[:notice] = "Thanks for smoking in."
      redirect_to trends_path
    else
      flash[:alert] = "Oops something happened."
      render "show"
    end
  end

  def trends
    now = Time.now
    yesterday = Time.now - 1.day
    @title = "Trending"
    time = Time.now
    @trends = Strain.joins(:smokeins).group("strains.id").where(created_at: yesterday..now).order("count(smokeins.strain_id) DESC").limit(3)
  end
end
