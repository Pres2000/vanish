class Booking < ApplicationRecord
  belongs_to :van_id
  belongs_to :user_id
end
