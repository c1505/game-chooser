class Search
  # Searches the google api specifically to boardgamegeek.com and returns JSON.
  def initialize(query)
    @query = query
    @api_key = Rails.application.secrets.google_api_key
    @url = "https://www.googleapis.com/customsearch/v1?key=AIzaSyAXUV1gIBK-iNnqvlq67bYkweUcV_aiGD4&cx=#{@api_key}:dhkps_7te2y&q=#{@query}"
  end

  def link
    fetch.parsed_response["items"].first["link"]
  end

  def game_id
    link[/\d+/]
    # FIXME validate that this is a digit
  end

  private
  def fetch
    HTTParty.get(@url)
  end

end
