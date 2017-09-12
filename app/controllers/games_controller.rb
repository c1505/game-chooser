class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    search = Search.new(params[:game][:name])
    game_id = search.game_id
    
    game = BoardGameGeek.new(game_id)
    @collection = Collection.find(params[:collection_id])
    @game = @collection.games.build(game.transform)
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
  end
  
  private
  def games_params
    params.require(:game).permit(:name)
  end
end
