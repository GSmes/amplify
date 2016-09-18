class SetlistsController < ApplicationController
  def index
    @setlists = setlist_service.artist_events(params['artistName'])
  end
end
