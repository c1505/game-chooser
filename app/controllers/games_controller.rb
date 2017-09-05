class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def filter
    complexity = params[:complexity]
    players = params[:players]
    minutes = params[:time]
    @games = Game.enough_players(players).enough_spaces(players).enough_time(minutes).complexity(complexity)
    render "index"
  end

end
