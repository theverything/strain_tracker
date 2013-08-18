class StrainsController < ApplicationController
  before_filter :authenticate

  def index
    @title = "Search"
    @strains = Strain.all
    respond_to do |format|
      format.html
      format.json { render json: @strains }
    end
  end

  def show
    @title = "Strain"
    @strain = Strain.find(params[:id])
    @smokein = Smokein.new
    if @strain.category == "Indica"
      @category_image = "/assets/IndicaIconBig.png"
      @category_name =  "Indica"
    elsif @strain.category == "Sativa"
      @category_image = "/assets/SativaIconBig.png"
      @category_name = "Sativa"
    else @strain.category == "Hybrid"
      @category_image = "/assets/HybridIconBig.png"
      @category_name = "Hybrid"
    end
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

  private

  def authenticate
    unless current_user
      redirect_to root_path
    end
  end
end
