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
  end

  def search
    @strains = Strain.find_by_fuzzy_name(params[:s], :limit => 5)
    render json: @strains
  end
end
