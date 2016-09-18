class Event
  # Artist = Struct.new(:name)
  # Song = Struct.new(:title)

  def initialize(event_hash)
    @response = event_hash
  end

  def artist
    response[:artist][:@name]
    # Artist.new(response[:artist][:@name])
  end

  def date
    Date.parse(response[:@eventDate])
  end

  def setlist
    songs = SetlistParser.new(response).songs_array

    songs.map do |song|
      song[:@name]
    end
    # all_songs = songs.map do |song|
    #   Song.new(song[:@name])
    # end
  end

  # def self.service
  #   @@service ||= SetlistService.new
  # end
  #
  # def self.all_by_artist(artist_name)
  #   events_hashes = service.search_by_artist(artist_name)
  #   events = events_hashes.map do |event_hash|
  #     Event.new( event_hash )
  #   end
  # end
  #
  # def self.find(setlist_id)
  #   event_hash = service.get_event(setlist_id)
  #   Event.new( event_hash )
  # end

  private

  attr_reader :response
end
