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
    link[/\d+/]
    # FIXME validate that this is a digit
  end

  private
  def fetch
    HTTParty.get(@url)
  end

end
