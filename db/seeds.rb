# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_hash = JSON.parse(open(url).read)

ingredient_hash["drinks"].each do |hash|
  name_of_ingredient = hash['strIngredient1']
  ingredient = Ingredient.create(name: name_of_ingredient)
end

Cocktail.destroy_all
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  cocktail = Cocktail.new(name: 'Moonlight Cocktail')
    cocktail.photo.attach(io: file, filename: 'cocktail.png', content_type: 'image/png')
