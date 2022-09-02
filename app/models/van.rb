class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_model_and_location,
                  against: %i[model location listing_title description],
                  associated_against: {
                    user: [ :first_name, :last_name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :listing_title, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
