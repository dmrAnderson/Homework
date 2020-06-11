# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  City.create(id: n, name: "City-#{n}")
end

5.times do |n|
  Cleaner.create(first_name: "Name-#{n}", last_name: "Name-#{n}")
end

Cleaner.all.each do |c|
  3.times do |n|
    c.workplaces.create(city_id: n)
  end
end
