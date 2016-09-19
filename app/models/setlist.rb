class Setlist
  attr_reader :artist,
              :date,
              :venue,
              :songs

  def initialize(event_hash)
    @event_hash = event_hash
    generate_setlist
  end

  def generate_setlist
    @artist = get_artist
    @date = get_date
    @venue = get_venue
    @songs = get_songs
  end

  def get_artist
    event_hash[:artist][:@name]
  end

  def get_date
    Date.parse(event_hash[:@eventDate])
  end

  def get_venue
    event_hash[:venue][:@name]
  end

  def get_songs
    songs = SetlistParser.new(event_hash).songs_array

    songs.map do |song|
      song[:@name]
    end
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

  attr_reader :event_hash

  def self.service(artist_name)
    service ||= SetlistService.new
    @response = service.artist_events(artist_name)
  end
end
