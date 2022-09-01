# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroy Vans"
Van.destroy_all
puts "Destroy Users"
User.destroy_all

vanFiles = Dir.glob("app/assets/images/pexe*")
vanFilesIndex = 0
userFiles = Dir.glob("app/assets/images/Profiles/u*")
userFilesIndex = 0

address = ["2 Avenue des Saules, 59160 Lille",
           "IJsbaanpad 9, 1076 CV Amsterdam",
           "Carrer del Bruc 149, 08037 Barcelona",
           "2-11-3 Meguro, Meguro-ku, Tokyo",
           "Av. Dorrego 2133, C1414 CABA",
           "5333, avenue Casgrain, suite 102, Montréal, H2T1X3",
           "Rudi-Dutschke-Straße 26, 10969 Berlin",
           "Les Kocottes Old Post Office Road St Pierre, Moka",
           "Dubai Knowledge Park, Al Sufouh Dubai",
           "Cantersteen Street 10, 1000 Brussels"]

firstName = ["Luke",
             "Darth",
             "Leia",
             "Borvo",
             "Kylo",
             "Lyra",
             "Captain",
             "Han",
             "Asajj",
             "Jyn"]

lastname = ["Skywalker",
            "Caedus",
            "Organa",
            "the Hutt",
            "Ren",
            "Erso",
            "Phasma",
            "Solo",
            "Ventress",
            "Erso"]


10.times do
  puts "Create a user"
  fn = firstName[userFilesIndex]
  ln = lastname[userFilesIndex]
  user = User.create(first_name: fn, last_name: ln, email: "user#{userFilesIndex}@vanish.box", password: "123456", licence: Faker::DrivingLicence.northern_irish_driving_licence, bio: Faker::Games::WorldOfWarcraft.quote )
  filename = "#{fn.strip}#{ln.strip}.jpeg"
  puts "#{fn} #{ln}"
  file = File.open(userFiles[userFilesIndex])
  #file = URI.open("https://loremflickr.com/320/240/paris,girl/all")
  user.photo.attach(io: file, filename: filename, content_type: "image/jpeg")
  user.save

  puts "Create a Van"
    title = Faker::TvShows::GameOfThrones.dragon
    van = Van.create(listing_title: title, description: Faker::TvShows::GameOfThrones.quote, location: address[vanFilesIndex], cost: rand(1..12), model: "Ford", year: rand(1990..2022), dimentions: "4m x 2.5m", capacity: rand(2..5), fuel_type: "diesel", bathroom: false, kitchen: true, mileage: rand(5000..20000) )
    van.user = user
    #filename = "#{title.strip}.jpeg"
    filename = "#{vanFiles[vanFilesIndex].split('/').last}"
    file = File.open(vanFiles[vanFilesIndex])
    #file = URI.open("https://loremflickr.com/320/240/camper,car")
    van.photos.attach(io: file, filename: filename, content_type: "image/jpeg")
    van.save
    vanFilesIndex += 1
    userFilesIndex += 1
end


# https://loremflickr.com/g/320/240/camper/all
