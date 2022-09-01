class UsersController < ApplicationController
  def index
    user_bookings = current_user.bookings.all
  end
end
