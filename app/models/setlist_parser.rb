class SetlistParser
  def initialize(json_response)
    @response = json_response
  end

  def songs_array
    retrieve_set.each_with_object([]) do |setlist_entry, songs|
      # binding.pry
      songs.concat(setlist_entry[:song])
    end
  end

  private

  attr_reader :response

  def retrieve_set
    sets = response[:sets]

    if sets.blank?
      []
    else
      sets[:set]
    end
  end
end
