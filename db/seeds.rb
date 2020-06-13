# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sities_arr = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia"]
name = [["Elias", "Conway"] ,["Jermaine", "Weiss"] ,["Rania", "Griffiths"] ,["Rayyan", "Webb"] ,["Ryan", "Cooke"]]

10.times do |n|
  City.create(id: n, name: sities_arr[n])
end

5.times do |n|
  Cleaner.create(first_name: name[n][0], last_name: name[n][1], quality_scope: n)
end

Cleaner.all.each do |c|
  3.times do |n|
    c.workplaces.create(city_id: n)
  end
end
