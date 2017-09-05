class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def filter
    complexity = params[:complexity]
    players = params[:players]
    minutes = params[:time]
    quantity = params[:quantity]
    @games = Game.enough_players(players)
            .enough_spaces(players)
            .enough_time(minutes)
            .complexity(complexity)
    unless quantity.blank?
      quantity = quantity.to_i
      @games = @games.sample(quantity)
    end
    render "index"
  end

end
