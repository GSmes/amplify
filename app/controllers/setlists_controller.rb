class SetlistsController < ApplicationController
  def index
    @query = params['artistName']
    @setlists = Setlist.find_all(@query)
  end
end
