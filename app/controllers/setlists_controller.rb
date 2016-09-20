class SetlistsController < ApplicationController
  def index
    @setlists = Setlist.find_all(params['artistName'])
  end
end
