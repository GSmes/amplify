class SetlistParser
  def initialize(json_response)
    @response = json_response
  end

  def songs_array
    sa = []
    retrieve_set.each do |setlist_entry, songs|
      sa << setlist_entry[:song] unless setlist_entry.class == Symbol
      sa << songs unless songs.blank?
      # binding.pry
      # songs.concat([setlist_entry[:song]])
    end
    return sa.flatten
    # retrieve_set.each_with_object([]) do |setlist_entry, songs|
    #   # binding.pry
    #   songs.concat([setlist_entry[:song]])
    # end.flatten
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
