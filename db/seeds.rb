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
puts "destroying all items"
Booking.destroy_all
Item.destroy_all
User.destroy_all

puts "create users"

user = User.new(email: "bruce.lee@gmail.com", password: "123456", first_name: "Bruce", last_name: "Lee")
user.save

user = User.new(email: "ryan.raynolds@gmail.com", password: "123456", first_name: "Ryan", last_name: "Raynolds")
user.save

user = User.new(email: "cher@believe.com", password: "123456", first_name: "Cher", last_name: "Mee")
user.save

user = User.new(email: "emre.ebe@gmail.com", password: "123456", first_name: "Emre", last_name: "Ebegul")
user.save

user = User.new(email: "iron.man@gmail.com", password: "123456", first_name: "Iron", last_name: "Man")
user.save

puts "adding items"
file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1711448749/pexels-yuri-manei-2235071_rmoew6.jpg?_s=public-apps")
item = Item.new(brand: "Gucci", size: "20", color: "pink", price_per_day: "56", garment_type: "Dresses", description: "Fantastic silk dress for hot summer days")
item.photo.attach(io: file, filename: "a", content_type: "image/png")
item.user = User.second
item.save

puts "item created"

file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448748/pexels-quan-tran-20661848_b6vsyj.jpg")
item = Item.new(brand: "Prada", size: "32", color: "white", price_per_day: "20", garment_type: "Dresses", description: "Flower Dress for your special day")
item.photo.attach(io: file, filename: "b", content_type: "image/png")
item.user = User.first
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-godisable-jacob-908935_v6evrd.jpg")
item = Item.new(brand: "Zimmerman", size: "32", color: "white", price_per_day: "20", garment_type: "Dresses", description: "Floral dream of yours")
item.photo.attach(io: file, filename: "c", content_type: "image/png")
item.user = User.first
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448748/pexels-%D1%81%D0%BD%D0%B5%D0%B6%D0%B0%D0%BD%D0%B0-2173357_hq3nr4.jpg")
item = Item.new(brand: "Zimmerman", size: "32", color: "white", price_per_day: "20", garment_type: "Dresses", description: "Feeling like a fairy")
item.photo.attach(io: file, filename: "d", content_type: "image/png")
item.user = User.first
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-sheng-ye-20687365_k5q8rq.jpg")
item = Item.new(brand: "Zimmerman", size: "32", color: "white", price_per_day: "20", garment_type: "Dresses", description: "We got your back")
item.photo.attach(io: file, filename: "e", content_type: "image/png")
item.user = User.last
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-anne-985635_q4nlv2.jpg")
item = Item.new(brand: "Zimmerman", size: "32", color: "Green", price_per_day: "20", garment_type: "Dresses", description: "Feel like a royalty")
item.photo.attach(io: file, filename: "f", content_type: "image/png")
item.user = User.fourth
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-godisable-jacob-1416377_hsc4k3.jpg")
item = Item.new(brand: "Ipekyol", size: "32", color: "Yellow", price_per_day: "20", garment_type: "Dresses", description: "Add Joy to your day")
item.photo.attach(io: file, filename: "g", content_type: "image/png")
item.user = User.second
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-evg-kowalievska-1055691_begiwi.jpg")
item = Item.new(brand: "Ipekyol", size: "32", color: "Yellow", price_per_day: "20", garment_type: "Dresses", description: "So I wanna love you")
item.photo.attach(io: file, filename: "h", content_type: "image/png")
item.user = User.third
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-quang-anh-ha-nguyen-902030_iyoko4.jpg")
item = Item.new(brand: "H&M", size: "32", color: "Yellow", price_per_day: "20", garment_type: "Dresses", description: "I won't take you for granted")
item.photo.attach(io: file, filename: "h", content_type: "image/png")
item.user = User.first
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448748/pexels-pixabay-219604_d1db9o.jpg")
item = Item.new(brand: "Zara", size: "32", color: "Black", price_per_day: "20", garment_type: "Dresses", description: "If I were you")
item.photo.attach(io: file, filename: "h", content_type: "image/png")
item.user = User.second
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711448747/pexels-pixabay-458694_giktil.jpg")
item = Item.new(brand: "Versace", size: "32", color: "Gold", price_per_day: "20", garment_type: "Dresses", description: "Shine bright like a diamond")
item.photo.attach(io: file, filename: "h", content_type: "image/png")
item.user = User.second
puts "item created" if item.save


file = URI.open("https://res.cloudinary.com/dyle4qbxp/image/upload/v1711377928/samples/woman-on-a-football-field.jpg")
item = Item.new(brand: "DKNY", size: "32", color: "Gray", price_per_day: "20", garment_type: "Knitwear", description: "I just walked away")
item.photo.attach(io: file, filename: "h", content_type: "image/png")
item.user = User.first
puts "item created" if item.save
