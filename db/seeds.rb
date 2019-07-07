# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'dave@gmail.com', password: 'password', password_confirmation: 'password')
user2 = User.create(email: 'james@gmail.com', password: 'password', password_confirmation: 'password')

Restaurant.create( name: "Archeo", address: "123 Distillery lane", price_range: "$$", picture_url: "", user_id: user.id )

Restaurant.create( name: "Fermenting Cellar", address: "679 Distillery lane", price_range: "$$$", picture_url: "", user_id: user.id )

Restaurant.create( name: "Electric Mudd BBQ", address: "13 Brock ave.", price_range: "$$", picture_url: "", user_id: user2.id )

Restaurant.create( name: "The Ace", address: "456 Roncesvalles ave.", price_range: "$$", picture_url: "", user_id: user2.id )
