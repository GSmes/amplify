class SetlistParser
  def initialize(json_response)
    @response = json_response
  end

  def songs_array
    sa = []
    retrieve_set.each do |setlist_entry, songs|
      sa << setlist_entry[:song] unless setlist_entry.class == Symbol
      sa << songs unless songs.blank?
    end
    sa.flatten
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
