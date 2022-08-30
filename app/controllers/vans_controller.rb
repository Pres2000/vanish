class VansController < ApplicationController

  def index
    @vans = Van.all
  end

  def new
    @van = Van.new
  end

  def show
    @van = Van.find(params[:id])
  end

  private

  def van_params
    params.require(:van).permit(%i[listing_title description location cost model year mileage dimentions capacity fuel_type bathroom kitchen])
  end
end
