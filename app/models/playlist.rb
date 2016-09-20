class Playlist
  # def initialize
  #   # code
  # end

  def self.create_playlist(user, playlist_name)
    playlist = service.new_playlist(user, playlist_name)
  end

  def self.service
    SpotifyService.new
  end

  private

  # def method_name
  #   # code
  # end
end
