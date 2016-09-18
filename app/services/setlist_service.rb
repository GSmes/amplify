class SetlistService
  def initialize
    @connection = Faraday.new("http://api.setlist.fm/rest/0.1/")
  end

  def search_by_artist(artist_name)
    response = connection.get do |req|
      req.url 'search/setlists.json'
      req.params['artistName'] = artist_name
    end
    events_hashes = parse(response)[:setlists][:setlist]
    events_hashes.map do |event_hash|
      Event.new(event_hash).setlist
    end
  end

  # def get_event(setlist_id)
  #   response = connection.get("setlist/#{setlist_id}.json")
  #   event_hash = parse(response)[:setlist]
  #   Event.new(event_hash)
  # end

  private

  attr_reader :connection

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

## run `rails runner app/services/setlist_service.rb` to see response in JSON ##
SetlistService.new.search_by_artist("Pearl Jam")
# SetlistService.new.get_event("5bfccf3c")
