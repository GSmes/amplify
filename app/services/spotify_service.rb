class SpotifyService
  def initialize
    @connection = Faraday.new("https://api.spotify.com/v1/")
  end

  def new_playlist(user, playlist_name)
    response = connection.post do |req|
      req.url "users/#{user.name}/playlists"
      req.headers['Authorization'] = "Bearer #{user.access_token}"
      req.headers['Content-Type'] = 'application/json'
      req.body = "{\"name\":\"#{playlist_name}\",\"public\":false}"
    end
    parse(response)
  end

  private

  attr_reader :connection

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
