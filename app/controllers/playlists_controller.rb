class PlaylistsController < ApplicationController
  def create
    Playlist.new(current_user, playlist_params)
    flash[:success] = "#{playlist_params[:playlist_name]} was successfully created!"
    redirect_to search_path
  end

  private

  def playlist_params
    {
      playlist_name: params[:playlist_name],
      artist: params[:artist],
      songs: params[:songs]
    }
  end
end
