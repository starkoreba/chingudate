# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Clearing Users'
User.destroy_all

puts 'Creating 6 users'
6.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    nickname: Faker::FunnyName.name,
    city: 'Bordeaux',
    phone_number: '06 66 66 66 66'
  )
#  user1 = User.create(email: 'mel@mail.com', password:  )
# un pour le parcours utilisateur
# un pour le parcours presta

  puts 'Creating offers'
  6.times do
    user.offers.create!(
      title: Faker::Address.street_address,
      description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      location: Faker::Address.city,
      start_date: '2022-11-30 10:00:00',
      end_date: '2022-12-01 21:00:00'
    )
  end
end
puts 'Finished!'

# puts 'Clearing Bookings'
# Booking.destroy_all

# puts 'Creating 2 bookings'

# booking1 = { start_date: 2022-11-30 10:00:00, end_date: 2022-12-01 21:00:00 }
# booking1.save!
# booking2 = { start_date: 2022-11-29 10:00:00, end_date: 2022-12-01 21:00:00 }
# booking2.save!
# end
# puts 'Finished!'
