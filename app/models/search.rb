class Search
  # Searches the google api specifically to boardgamegeek.com and returns JSON.
  def initialize(query)
    @query = query
    @api_key = Rails.application.secrets.google_api_key
    @url = "https://www.googleapis.com/customsearch/v1?key=#{@api_key}&cx=006396486437962354856:dhkps_7te2y&q=#{@query}"
  end
  
  def link
    fetch.parsed_response["items"].first["link"]
  end

  def game_id
    if link.include?("boardgamegeek.com/boardgame")
      link[/\d+/]
    end
    # FIXME validate that this is a digit
    # FIXME should this be an error message that tells me that no game was found
  end

  private
  def fetch
    encoded_url = URI.encode(@url)
    HTTParty.get(encoded_url)
  end

end
