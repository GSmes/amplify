class SpotifyService
  def initialize
    @connection = Faraday.new("https://api.spotify.com/v1/") do |conn|
      conn.headers["Authorization"] = "Bearer #{current_user.access_token}"
  end

  def artist_events(artist_name)
    response = connection.get do |req|
      req.url 'search/setlists.json'
      req.params['artistName'] = artist_name
    end
    events_hashes = parse(response)[:setlists][:setlist]
    events_hashes.map do |event_hash|
      Setlist.new(event_hash)
    end
  end

  private

  attr_reader :connection

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

## run `rails runner app/services/setlist_service.rb` to see response in JSON ##
# SetlistService.new.artist_events("Pearl Jam")
# SetlistService.new.get_event("5bfccf3c")
