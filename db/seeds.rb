require 'faker'

Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all
Stroll.destroy_all

nbcity = 20
nbdogsitter = 20
nbdog = 20
nbstroll = 20

dogsitters = []
dogs = []
cities = []
strolls = []

nbcity.times do |x|
  city = City.create(
  city: Faker::Address.city)
  cities << city
  puts "Seeding City nb#{x}"
end

nbdog.times do |x|
  dog = Dog.create(
    name: Faker::Name.name,
    city_id: cities[rand(0..nbcity-1)].id)
    dogs << dog
  puts "Seeding Dog nb#{x}"
end

nbdogsitter.times do |x|
	dogsitter = Dogsitter.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: cities[rand(0..nbcity-1)])
    dogsitters << dogsitter
  puts "Seeding Dogsitter nb#{x}"
end

t1 = Time.parse("2019-10-23 14:40:34")
t2 = Time.parse("2021-01-01 00:00:00")
nbstroll.times do |x|
    stroll = Stroll.create(
    dogsitter_id: dogsitters[rand(0..nbdogsitter-1)].id,
    dog_id: dogs[rand(0..nbdog-1)].id,
    city_id: cities[rand(0..nbcity-1)].id,
    date: rand(t1..t2))
  puts "Seeding Strolls nb#{x}"
end


