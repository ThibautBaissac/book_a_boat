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
user_6 = User.new(first_name: "Jack", last_name: "Sparrow", email: "captainjs@gmail.com", password: "123456")
user_6.save!

puts "Creating demo ships..."
cruiser = Ship.new(name: "Titan", description: "Superbe ITALIAMARINE SANREMO 24 en très bon état! Très agréable en navigation et confortable au mouillage avec ses 2 bains de soleil à l'avant et à l'arrière. Les entretiens du moteur sont réalisés par un professionnel, factures à l'appui. Moteur Mercury Verado 225 cv dont la réputation n'est plus à faire.", category: "Cruiser", address: "Riva del Carbon, 4637, 30124 Venezia VE, Italie", docking_number: 27, daily_price: 260, user: user_6)
cruiser.save!
puts "Created #{cruiser.name}!"
yacht = Ship.new(name: "Véga", description: "Bonjour, Je vous propose à la location mon Yacht San Lorenzo 70 avec Fly (Rooftop), de 21 mètres de longueur pour une surface utile d'environ 100M2", category: "Yacht", address: "31 Marina Coastal Dr, Singapour", docking_number: 5, daily_price: 2600, user: user_6)
yacht.save!
puts "Created #{yacht.name}!"
bark = Ship.new(name: "Lubullule", description: "Bonjour et bienvenue à Paris
Nous vous proposons notre barque en polyéthylène de 2013 excellent état, deux moteurs de 250cv, cabine spacieuse à l’avant.
Idéale pour les sorties familiales, nous vous suggérons le Crackhead Tour le long du canal Saint-Martin.
Réservez ce bateau, avec ou sans son équipage professionnel.", category: "Bark", address: "120 Quai de Jemmapes, Paris", docking_number: 42, daily_price: 190, user: user_6)
bark.save!
puts "Created #{bark.name}!"
container = Ship.new(name: "Titus", description: "Superbe Porte-conteneur SANREMO 24 en très bon état! Très agréable en navigation et confortable avec son pont supérieur de 150m, parfait pour les boat parties!", category: "Container Carrier", address: "Port Suez, Égypte", docking_number: 21, daily_price: 90000, user: user_6)
container.save!
puts "Created #{container.name}!"
sailboat = Ship.new(name: "Vegedream", description: "Bonjour, Je vous propose à la location mon Yacht San Lorenzo 70 avec Fly (Rooftop), de 21 mètres de longueur pour une surface utile d'environ 100M2", category: "Sailboat", address: "Chau. Eric Tabarly, 35400 Saint-Malo", docking_number: 19, daily_price: 400, user: user_6)
sailboat.save!
puts "Created #{sailboat.name}!"
pirate = Ship.new(name: "Black Pearl", description: "Le Black Pearl, anciennement Wicked Wench, est un navire pirate dirigé par le capitaine Jack Sparrow. Reconnaissable à ses voiles noires, le navire est surtout célèbre pour la malédiction qui pesait sur lui après la mutinerie d'Hector Barbossa, faisant du navire un navire maudit craint par tous. Il est connu comme le navire le plus rapide des Caraïbes.", category: "Pirate Boat", address: "F498+GJX, Santo Domingo 10210, République dominicaine", docking_number: 1, daily_price: 1890, user: user_6)
pirate.save!
puts "Created #{pirate.name}!"

puts "Creating ships..."
5.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Restaurant.description
  category = ["Boat", "Cruiser", "Pirate Boat", "Yacht", "Pedal Boat", "Rowboat", "Bark", "Catamaran", "Container Carrier", "Paper Boat", "Flamingo Boat", "Vessel", "Sailboat", "Optimist", "Laser", "Sailing Regatta", "Jet Boat", "Cabin Cruiser" ].sample
  address = Faker::Address.full_address
  docking_number = (1..100).to_a.sample
  daily_price = [1, 9, 100, 450, 1000, 8700, 9500, 9999, 15000, 16999, 36000, 122000, 50000].sample
  ship = Ship.new(name: name, description: description, category: category, address: address, docking_number: docking_number, daily_price: daily_price, user: user_1)
  ship.save!
  puts "Created #{ship.name}"
end
puts "Finished!"
