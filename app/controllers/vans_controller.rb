class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @vans = Van.all
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude
      }
    end
  end

  def new
    @van = Van.new
  end

  def show
    @van = Van.find(params[:id])
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save
      redirect_to van_path(@van), notice: "Van was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def van_params
    params.require(:van).permit(:listing_title, :description, :model, :year, :bathroom, :kitchen, :dimentions, :capacity, :cost)
    # params.require(:van).permit(%i[listing_title description location cost model year mileage dimentions capacity fuel_type bathroom kitchen])
  end
end
