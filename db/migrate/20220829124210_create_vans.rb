class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.string :listing_title
      t.text :description
      t.string :location
      t.integer :cost
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :dimentions
      t.integer :capacity
      t.string :fuel_type
      t.references :user, null: false, foreign_key: true
      t.boolean :bathroom
      t.boolean :kitchen

      t.timestamps
    end
  end
end
