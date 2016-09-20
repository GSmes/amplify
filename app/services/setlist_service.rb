class SetlistService
  def initialize
    @connection = Faraday.new("http://api.setlist.fm/rest/0.1/")
  end

  def artist_events(artist_name)
    response = connection.get do |req|
      req.url 'search/setlists.json'
      req.params['artistName'] = artist_name
    end
    parse(response)[:setlists][:setlist]
  end

  private

  attr_reader :connection

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
