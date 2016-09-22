class Setlist
  attr_reader :artist,
              :date,
              :venue,
              :location,
              :songs

  def initialize(event_hash)
    @event_hash = event_hash
    @artist     = event_hash[:artist][:@name]
    @date       = Date.parse(event_hash[:@eventDate])
    @venue      = event_hash[:venue][:@name]
    @location   = format_location
    @songs      = get_songs
  end

  def self.find_all(artist_name)
    events = service.artist_events(artist_name)

    if events.blank?
      "We could not find the band or artist you were looking for. Please try another search."
    else
      events.map { |event| Setlist.new(event) }
    end
  end

  def self.service
    SetlistService.new
  end

  private

  attr_reader :event_hash

  def format_location
    "#{city}, #{state}, #{country}"
  end

  def city
    event_hash[:venue][:city][:@name]
  end

  def state
    event_hash[:venue][:city][:@state]
  end

  def country
    event_hash[:venue][:city][:country][:@code]
  end

  def get_songs
    songs = SetlistParser.new(event_hash).songs_array

    songs.map do |song|
      song[:@name]
    end
  end
end
