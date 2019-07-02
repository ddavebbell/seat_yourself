# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create( name: "Archeo", address: "123 Distillery lane", neighbourhood: "Downtown", price_range: "$$", picture_url: "", user_id: nil )

Restaurant.create( name: "Fermenting Cellar", address: "679 Distillery lane", neighbourhood: "Downtown", price_range: "$$$", picture_url: "", user_id: nil )

Restaurant.create( name: "Electric Mudd BBQ", address: "13 Brock ave.", neighbourhood: "Parkdale", price_range: "$$", picture_url: "", user_id: nil )

Restaurant.create( name: "The Ace", address: "456 Roncesvalles ave.", neighbourhood: "West-end", price_range: "$$", picture_url: "", user_id: nil )
