class BoardGameGeek
  attr_reader :categories, :mechanics, :games_hash
  def initialize(id)
    @id = id
    @api_url = "https://www.boardgamegeek.com/xmlapi/boardgame/#{@id}?&stats=1"
  end

  def transform
    response = fetch
    name = response["name"]
    if name.class == Hash  #FIXME .  There is probably a better way to handle this
      name = name["__content__"]
    else
      name = name.select {|f| f["primary"] == "true"}[0]["__content__"]
    end
    min_players = response["minplayers"]
    max_players = response["maxplayers"]
    time = response["playingtime"]
    complexity = response["statistics"]["ratings"]["averageweight"]
    rating = response["statistics"]["ratings"]["average"]
    image_link = response["thumbnail"]
    categories = response["boardgamesubdomain"].map {|f| f["__content__"]}
    mechanics = response["boardgamemechanic"].map {|f| f["__content__"]}
    
    @categories = categories
    @mechanics = mechanics
    
    @games_hash = {name: name, min_players: min_players, max_players: max_players, time: time,
      complexity: complexity, rating: rating, image_link: image_link, geek_id: @id,
    }
  end

  private
  def fetch
    HTTParty.get(@api_url)["boardgames"]["boardgame"]
  end

end