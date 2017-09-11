class BoardGameGeek
  def initialize(id)
    @id = id
    @url = "https://www.boardgamegeek.com/xmlapi/boardgame/#{@id}?&stats=1"
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
    {min_players: min_players, max_players: max_players, time: time,
      complexity: complexity, rating: rating, name: name}
  end

  private
  def fetch
    HTTParty.get(@url)["boardgames"]["boardgame"]
  end

end
# example_id = 2536
