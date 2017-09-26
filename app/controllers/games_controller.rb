class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    @collection = Collection.find(params[:collection_id])
    unless current_user == @collection.user
      flash[:alert] = "Error.  Please sign in and try again"
      redirect_to root_path and return
    end
    
    search = Search.new(params[:game][:name])
    game_id = search.game_id
    if game_id.nil?
      flash[:alert] = "The Game could not be found.  Please add it manually"
      redirect_to @collection and return
    end
    
    game_geek = BoardGameGeek.new(game_id)
    game_geek.transform
    
    @game = @collection.games.build(game_geek.games_hash)
    @game.geek_link = search.link
    @game.mechanic_list.add(game_geek.mechanics)
    @game.category_list.add(game_geek.categories)
    if @game.save
      flash[:notice] = "#{@game.name} added to your collection"
      redirect_to @collection
    else
      flash[:alert] = "There was an error and the game could not be added automatically."
      render new
    end
    
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @game = @collection.games.build
    unless current_user == @collection.user
      flash[:alert] = "Error.  Please sign in and try again"
      redirect_to root_path and return
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @collection = @game.collection
    unless current_user == @collection.user
      flash[:alert] = "Error.  Please sign in and try again"
      redirect_to root_path and return
    end
    if @game.destroy
      flash[:notice] = "#{@game.name} has been deleted"
    else
      flash[:alert] = "Error.  Please try again"
    end
    redirect_back(fallback_location: root_path)
  end
  
end
