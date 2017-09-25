# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#



# Game.create(
#   name: "Chess",
#   time: 60,
#   min_players: 2,
#   max_players: 2,
#   complexity: 3.75,
#   rating: 7.1
#   )
  
# Game.create(
#   name: "Catan",
#   time: 90,
#   min_players: 3,
#   max_players: 4,
#   complexity: 2.36,
#   rating: 7.3
#   )
  
# Game.create(
#   name: "Scrabble",
#   time: 90,
#   min_players: 2,
#   max_players: 4,
#   complexity: 2.13,
#   rating: 6.3
#   )
  
# Game.create(
#   name: "Ticket to Ride",
#   time: 45,
#   min_players: 2,
#   max_players: 5,
#   complexity: 1.87,
#   rating: 7.5
#   )

# Game.create(
#   name: "Cards Against Humanity",
#   time: 30,
#   min_players: 4,
#   max_players: 30,
#   complexity: 1.25,
#   rating: 6.2
#   )

# Game.create(
#   name: "Exploding Kittens",
#   time: 15,
#   min_players: 2,
#   max_players: 5,
#   complexity: 1.07,
#   rating: 5.9
#   )
  
# Game.create(
#   name: "Codenames",
#   time: 15,
#   min_players: 2,
#   max_players: 8,
#   complexity: 1.36,
#   rating: 7.9
#   )

# Game.create(
#   name: "Cranium",
#   time: 60,
#   min_players: 4,
#   max_players: 16,
#   complexity: 1.44,
#   rating: 5.7
#   )

# Game.create(
#   name: "Betrayal at House on the Hill",
#   time: 60,
#   min_players: 3,
#   max_players: 6,
#   complexity: 2.36,
#   rating: 7.1
#   )
  
# Game.create(
#   name: "Jenga",
#   time: 20,
#   min_players: 1,
#   max_players: 8,
#   complexity: 1.14,
#   rating: 5.6
#   )
  

csv_text = File.read('50-rest_games.csv')
csv = CSV.parse(csv_text, :headers => false)
csv = csv.flatten
csv = csv.map {|row| row.split("\n") }.flatten

csv.each do |game_name|
  
  search = Search.new(game_name)
  game_id = search.game_id
  if game_id
    game_geek = BoardGameGeek.new(game_id)
    game_geek.transform
    collection = Collection.find(2) #triangle game night
    game = collection.games.build(game_geek.games_hash)
    game.geek_link = search.link
    game.mechanic_list.add(game_geek.mechanics)
    game.category_list.add(game_geek.categories)
    game.save
  else
    puts "Game not found"
  end
end
#FIXME this breaks somewhere