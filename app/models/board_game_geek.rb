class BoardGameGeek
  def initialize(id)
    @id = id
    @url = "https://www.boardgamegeek.com/xmlapi/boardgame/#{@id}?&stats=1"
  end

  def transform
    binding.pry
    response = fetch
    name = response["name"] #FIXME error in how pandemic responds.  multiple names
    name.select {|f| f["primary"] == "true"}[0]["__content__"]
    # problem is that for just one it is a hash rather than an array
    # itempotent way to turn into an array?
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
