class Setlist
  attr_reader :artist,
              :date,
              :venue,
              :location,
              :songs

  def initialize(event_hash)
    @event_hash = event_hash
    generate_setlist
  end

  def generate_setlist
    @artist = get_artist
    @date = get_date
    @venue = get_venue
    @location = get_location
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

  def get_location
    "#{city}, #{state}, #{country}"
  end

  def get_songs
    songs = SetlistParser.new(event_hash).songs_array

    songs.map do |song|
      song[:@name]
    end
  end

  private

  attr_reader :event_hash

  def city
    event_hash[:venue][:city][:@name]
  end

  def state
    event_hash[:venue][:city][:@state]
  end

  def country
    event_hash[:venue][:city][:country][:@code]
  end

  def self.service(artist_name)
    service ||= SetlistService.new
    @response = service.artist_events(artist_name)
  end
end
