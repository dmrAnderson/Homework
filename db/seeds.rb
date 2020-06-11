# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# number = (0..9).to_a.shuffle.join.to_i
quolity = (1..5).to_a.sample.to_i

2.times do |n|
  City.create(city: "City-#{n}")

  Customer.create(first_name: "first_name-#{n}",
                  last_name: "last_name-#{n}",
                  phone_number: "123456789#{n}")

  Customer.find_by_first_name("first_name-#{n}").create_booking(date: Date.new, city: "City-#{n}", time: Time.now)

  Cleaner.create(first_name: "first_name-#{n}",
                 last_name: "last_name-#{n}")
  Cleaner.find_by_first_name("first_name-#{n}").workplaces.create(city_id: City.last.id)
end