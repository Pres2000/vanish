class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      sql_query = <<~SQL
        vans.listing_title @@ :query
        OR vans.location @@ :query
        OR vans.description @@ :query
        OR vans.model @@ :query
      SQL
      @vans = Van.joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      @vans = Van.all
    end
    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        info_window: render_to_string(partial: "info_window", locals: { van: van }),
        image_url: helpers.asset_url("vanish_logo.png")
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
    #save photo
    if @van.save
      redirect_to van_path(@van), notice: "Van was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def van_params
    params.require(:van).permit(:listing_title, :description, :model, :year, :bathroom, :kitchen, :dimentions, :capacity, :cost, :photos)
    # params.require(:van).permit(%i[listing_title description location cost model year mileage dimentions capacity fuel_type bathroom kitchen])
  end
end
