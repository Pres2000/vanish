class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.van = @van
    if @booking.save
      redirect_to van_path(@van), notice: "You successfully book the van"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @van = Van.find(params[:id])
  end
  def booking_params
    params.require(:booking).permit(:starting_date, :end_date, :num_guests)
  end
end
