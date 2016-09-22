class SetlistsController < ApplicationController
  def index
    @query = params[:artist_name]
    @setlists = Setlist.find_all(@query)
  end
end
