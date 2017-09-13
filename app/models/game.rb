class Game < ApplicationRecord
  belongs_to :collection
  acts_as_taggable
  acts_as_taggable_on :categories, :mechanics
  def self.enough_players(players)
    unless players.blank?
      players = players.to_i
      Game.where(min_players: 0..players)
    else
      Game.all
    end
  end

  def self.enough_spaces(players)
    unless players.blank?
      players = players.to_i
      Game.where(max_players: players..Float::INFINITY)
    else
      Game.all
    end
  end

  def self.enough_time(minutes)
    unless minutes.blank?
      minutes = minutes.to_i
      min_time = minutes * 0.7
      Game.where(time: min_time..minutes)
    else
      Game.all
    end
  end

  def self.complexity(complexity)
    unless complexity.blank?
      complexity = complexity.to_i
      min_complexity = complexity - 1
      max_complexity = complexity + 1
      Game.where(complexity: min_complexity..max_complexity)
    else
      Game.all
    end
  end
end
