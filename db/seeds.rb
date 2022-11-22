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

    puts 'Creating offers'
          6.times do
            offer = user.offers.create!(
            title: Faker::Internet.email,
            description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
            location: Faker::Nation.capital_city,
            start_date: '2022-11-30 10:00:00',
            end_date: '2022-12-01 21:00:00'
      )
    end
end
puts 'Finished!'

# puts 'Clearing Offers'
# Offer.destroy_all

# puts 'Creating 2 offers'

# offer1 = Offer.new (title: 'un week-end', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi finibus mauris tristique urna aliquet, at porta odio laoreet. Donec et molestie neque, et lectus.', location: 'Bordeaux', start_date: 2022-11-30 19:00:00, end_date: 2022-12-01 21:00:00)
# offer1.save!
# offer2 = Offer.new  (title: 'pour une soirée', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer libero nunc, faucibus id molestie eget, tempus vitae dolor. Etiam tristique, nisi non drna aliquet, at porta odio laoreet. Donec et molestie neque, et lectus.', location: 'Bordeaux', start_date: 2022-11-28 19:00:00, end_date: 2022-11-28 23:00:00)
# offer2.save!
# end
# puts 'Finished!'


# puts 'Clearing Bookings'
# Booking.destroy_all

# puts 'Creating 2 bookings'

# booking1 = { start_date: 2022-11-30 10:00:00, end_date: 2022-12-01 21:00:00 }
# booking1.save!
# booking2 = { start_date: 2022-11-29 10:00:00, end_date: 2022-12-01 21:00:00 }
# booking2.save!
# end
# puts 'Finished!'
