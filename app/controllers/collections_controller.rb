class CollectionsController < ApplicationController
  def show
    @games = Collection.find(params[:id]).games
  end

  def filter
    @collection = Collection.find(params[:id])
    complexity = params[:complexity]
    players = params[:players]
    minutes = params[:time]
    quantity = params[:quantity]
    @games = @collection.games.enough_players(players)
            .enough_spaces(players)
            .enough_time(minutes)
            .complexity(complexity)
    unless quantity.blank?
      quantity = quantity.to_i
      @games = @games.sample(quantity)
    end
    render "show"
  end
end