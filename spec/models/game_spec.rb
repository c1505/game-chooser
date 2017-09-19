require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#percentile_complexity" do

    it "returns the percentile for the most complex game" do 
      seed
      game = Game.find_by(name: "Chess")
      expect( game.percentile_complexity(Game.all) ).to eq 100
    end
    
    it "returns the percentile for the least complex game" do 
      seed
      game = Game.find_by(name: "Exploding Kittens")
      expect( game.percentile_complexity(Game.all) ).to eq 0
    end

    it "returns the percentile for the second least complex game" do
      seed
      game = Game.find_by(name: "Jenga")
      expect( game.percentile_complexity(Game.all) ).to eq 11.11111111111111
    end

  end
end

def seed
  Collection.create(name: "collection 1")
  Game.create(
  name: "Chess",
  time: 60,
  min_players: 2,
  max_players: 2,
  complexity: 3.75,
  rating: 7.1,
  collection_id: 1
  )
  
Game.create(
  name: "Catan",
  time: 90,
  min_players: 3,
  max_players: 4,
  complexity: 2.36,
  rating: 7.3,
  collection_id: 1
  )
  
Game.create(
  name: "Scrabble",
  time: 90,
  min_players: 2,
  max_players: 4,
  complexity: 2.13,
  rating: 6.3,
  collection_id: 1
  )
  
Game.create(
  name: "Ticket to Ride",
  time: 45,
  min_players: 2,
  max_players: 5,
  complexity: 1.87,
  rating: 7.5,
  collection_id: 1
  )

Game.create(
  name: "Cards Against Humanity",
  time: 30,
  min_players: 4,
  max_players: 30,
  complexity: 1.25,
  rating: 6.2,
  collection_id: 1
  )

Game.create(
  name: "Exploding Kittens",
  time: 15,
  min_players: 2,
  max_players: 5,
  complexity: 1.07,
  rating: 5.9,
  collection_id: 1
  )
  
Game.create(
  name: "Codenames",
  time: 15,
  min_players: 2,
  max_players: 8,
  complexity: 1.36,
  rating: 7.9,
  collection_id: 1
  )

Game.create(
  name: "Cranium",
  time: 60,
  min_players: 4,
  max_players: 16,
  complexity: 1.44,
  rating: 5.7,
  collection_id: 1
  )

Game.create(
  name: "Betrayal at House on the Hill",
  time: 60,
  min_players: 3,
  max_players: 6,
  complexity: 2.36,
  rating: 7.1,
  collection_id: 1
  )
  
Game.create(
  name: "Jenga",
  time: 20,
  min_players: 1,
  max_players: 8,
  complexity: 1.14,
  rating: 5.6,
  collection_id: 1
  )
end
