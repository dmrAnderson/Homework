# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  Cleaner.create(first_name: "first_name-#{n}",
                 last_name: "last_name-#{n}")

  Customer.create(first_name: "first_name-#{n}",
                  last_name: "last_name-#{n}",
                  phone_number: n)
                  
  City.create(city: "City-#{n}")
end