# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Cleaning database..."
Coworking.destroy_all
User.destroy_all
Booking.destroy_all

puts "Creating users..."
User.create(email: "louise@louise.com", password: "123456")
5.times do
  new_user = User.new(email: Faker::Internet.email, password: "123456")
  new_user.save!
end

puts "Creating coworkings..."
10.times do
  coworking = Coworking.new(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    description: Faker::ChuckNorris.fact,
    price_per_hour: (0..10).to_a.sample,
    user: User.all.sample
  )
  coworking.save!
end

puts "Creating bookings..."
10.times do
  booking = Booking.new(
    start_time: 14,
    end_time: 18,
    total_price: 24,
    user: User.all.sample,
    coworking: Coworking.all.sample
  )
  booking.save!
end

puts "Finished!"
