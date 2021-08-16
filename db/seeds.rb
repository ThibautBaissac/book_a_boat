# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Creating users..."
User.destroy_all
user_1 = User.new(first_name: "Daniela", last_name: "zubia", email: 'test1@gmail.com', password: "123456")
user_1.save!
user_2 = User.new(first_name: "Thibaut", last_name: "Baissac", email: "test2@gmail.com", password: "123456")
user_2.save!

puts "Cleaning database..."
Ship.destroy_all

puts "Creating ships..."
5.times do
  name = Faker::GreekPhilosophers.name
  category = ["Boat", "Cruise", "Pirate boat", "Yacht", "Pedal boat", "Rowboat", "Bark", "Catamaran", "Countainer carrier", "Paper boat"].sample
  city = Faker::Address.city
  docking_number = (1..100).to_a.sample
  daily_price = [1, 9, 100, 450, 1000, 8700, 36000, 122000, 50000].sample
  # photos = ["chinese", "italian", "japanese", "french", "belgian"].sample
  ship = Ship.new(name: name, category: category, city: city, docking_number: docking_number, daily_price: daily_price, user: user_1)
  ship.save!
  puts "Created #{ship.name}"
end
puts "Finished!"
