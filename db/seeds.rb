# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


5.times do
  fn = Faker::Movies::Hobbit.character
  ln = Faker::Movies::StarWars.character
  user = User.create(first_name: fn, last_name: ln, email: Faker::Internet.email, password: "123456", licence: Faker::DrivingLicence.northern_irish_driving_licence, bio: Faker::Games::WorldOfWarcraft.quote )
  filename = "#{fn.strip}#{ln.strip}.jpeg"
  puts filename
  file = URI.open("https://loremflickr.com/320/240/paris,girl/all")
  user.photo.attach(io: file, filename: filename, content_type: "image/jpeg")
  user.save

  2.times do
    title = Faker::TvShows::GameOfThrones.dragon
    van = Van.create(listing_title: title, description: Faker::TvShows::GameOfThrones.quote, location: Faker::TvShows::GameOfThrones.city, cost: rand(20..200), model: "Ford", year: rand(1990..2022), dimentions: "4m x 2.5m", capacity: rand(2..5), fuel_type: "diesel", bathroom: false, kitchen: true, mileage: rand(50000..200000) )
    van.user = user
    filename = "#{title.strip}.jpeg"
    file = URI.open("https://loremflickr.com/320/240/camper,car")
    van.photos.attach(io: file, filename: filename, content_type: "image/jpeg")
    van.save
  end
end


# https://loremflickr.com/g/320/240/camper/all
