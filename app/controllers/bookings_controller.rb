class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def index
    @user_bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.van = @van
    if @booking.save
      redirect_to bookings_path, notice: "You successfully booked the van"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @van = Van.find(params[:van_id])
  end
  def booking_params
    params.require(:booking).permit(:starting_date, :end_date, :num_guests)
  end
end
