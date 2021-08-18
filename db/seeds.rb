# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Ship.destroy_all
User.destroy_all


puts "Creating users..."
user_1 = User.new(first_name: "Daniela", last_name: "Zubia", email: "test1@gmail.com", password: "123456")
user_1.save!
user_2 = User.new(first_name: "Andrea", last_name: "Abbou", email: "test2@gmail.com", password: "123456")
user_2.save!
user_3 = User.new(first_name: "Amandine", last_name: "Arnould", email: "test3@gmail.com", password: "123456")
user_3.save!
user_4 = User.new(first_name: "Thibaut", last_name: "Baissac", email: "test4@gmail.com", password: "123456")
user_4.save!
user_5 = User.new(first_name: "Arthur", last_name: "Herminie", email: "test5@gmail.com", password: "123456")
user_5.save!

puts "Creating ships..."
5.times do
  name = Faker::GreekPhilosophers.name
  description = ["Superbe ITALIAMARINE SANREMO 24 en très bon état !Très agréable en navigation et confortable au mouillage avec ses 2 bains de soleil à l'avant et à l'arrière.Les entretiens du moteur sont réalisés par un professionnel, factures à l'appui.Moteur Mercury Verado 225 Cv dont la réputation n'est plus à faire.", "Ce Nimbus Avanta F33 Flybridge est en bon état général Disposant de 4 couchages répartis dans 2 cabines, ce bateau est très habitable.
Possibilité reprise place de port en location."]
  category = ["Boat", "Cruise", "Pirate boat", "Yacht", "Pedal boat", "Rowboat", "Bark", "Catamaran", "Countainer carrier", "Paper boat", "Flamingo boat", "Vessel", "Sailboat", "Optimist", "Laser", "Sailing Regatta", "Jet Boats", "Cabin Cruisers" ].sample
  city = Faker::Address.city
  docking_number = (1..100).to_a.sample
  daily_price = [1, 9, 100, 450, 1000, 8700, 9500, 9999, 15000, 16999, 36000, 122000, 50000].sample
  ship = Ship.new(name: name, description: description, category: category, city: city, docking_number: docking_number, daily_price: daily_price, user: user_1)
  ship.save!
  puts "Created #{ship.name}"
end
puts "Finished!"
