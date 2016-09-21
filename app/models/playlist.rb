class Playlist
  def initialize(user, playlist_params)
    playlist  = create_playlist(user, playlist_params[:playlist_name])
    songs     = find_songs(user, playlist_params[:artist], playlist_params[:songs])
    populate_playlist(user, playlist[:id], songs)
  end

  def create_playlist(user, playlist_name)
    service.new_playlist(user, playlist_name)
  end

  def find_songs(user, artist, songs_array)
    songs_array.map do |song|
      response = service.find_song(user, artist, song)
      next if response.blank?
      response[:uri]
    end.compact
  end

  def populate_playlist(user, playlist_id, songs)
    service.add_to_playlist(user, playlist_id, songs)
  end

  private

  def service
    SpotifyService.new
  end
end
