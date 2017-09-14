class GamesController < ApplicationController
  http_basic_authenticate_with name: "test", password: "nope", only: [:create, :new]
  def index
    @games = Game.all
  end

  def create
    search = Search.new(params[:game][:name])
    game_id = search.game_id
    
    game_geek = BoardGameGeek.new(game_id)
    game_geek.transform
    @collection = Collection.find(params[:collection_id])
    
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
  end
  
end
