class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :vans
  has_many :bookings
  # has_many :vans, through: :bookings, as: :booked_vans

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
