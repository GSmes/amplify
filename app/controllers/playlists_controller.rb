class PlaylistsController < ApplicationController
  def create
    playlist = Playlist.create_playlist(current_user, params['playlist_name'])
    flash[:success] = "#{playlist[:name]} was successfully created!"
    redirect_to search_path
  end
end
