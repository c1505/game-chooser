class CollectionsController < ApplicationController
  def show
    @games_params = games_params || {players: nil, time: nil, tags: {}, quantity: nil}
    @collection = Collection.find(params[:id])
    @tags = collection_tags
    if params[:games].nil?
      @games = @collection.games
      return
    else
      players = games_params[:players]
      minutes = games_params[:time]
      quantity = games_params[:quantity]
      @selected_tags = games_params[:tags].try(:keys)
      @games = @collection.games.enough_players(players)
              .enough_spaces(players)
              .enough_time(minutes)
              .tagged(@selected_tags)
              .order(rating: :desc)
      unless quantity.blank?
        quantity = quantity.to_i
        @games = @games.sample(quantity)
      end
    end
  end

  def index
    @collections = Collection.all
  end

  private
  def games_params
    params[:games]
  end

  def collection_tags
    @collection.games.map do |game|
      game.category_list
    end.flatten.uniq
  end

end
