# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "adding items"

file = URI.open("https://thumbor.forbes.com/thumbor/fit-in/1290x/https://www.forbes.com/advisor/wp-content/uploads/2023/12/poodle.jpg")
item = Item.new(brand: "Gucci", size: "32", color: "red", price_per_day: "56", category: "Skiwear", description: "hold on a second")
item.photo.attach(io: file, filename: "zv8p9l26m4i0fuzsznrrbuhjdh45", content_type: "image/png")
item.save
