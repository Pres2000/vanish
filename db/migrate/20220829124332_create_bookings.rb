class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :van, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :starting_date
      t.date :end_date
      t.integer :num_guests

      t.timestamps
    end
  end
end
