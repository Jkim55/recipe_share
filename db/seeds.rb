# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dietary_restrictions = [
  "Gluten Free",
  "Dairy Free",
  "Nut Free",
  "Pescetarian",
  "Vegetarian",
  "Kosher"
]

dietary_restrictions.each do |name|
  Category.create( name: name )
end

meals_courses = [
  "Breakfast",
  "Brunch",
  "Lunch",
  "Dinner",
  "Appetizer",
  "Side",
  "Dessert",
  "Beverage"
]

meals_courses.each do |name|
  Course.create( name: name )
end
