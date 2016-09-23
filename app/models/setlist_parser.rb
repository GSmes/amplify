class SetlistParser
  def initialize(event_hash)
    @event_hash = event_hash
  end

  def songs_array
    sa = []

    clean_set.each do |setlist_entry, songs|
      sa << setlist_entry[:song] unless setlist_entry.class == Symbol
      sa << songs unless songs.blank?
    end
    sa.flatten
  end

  private

  attr_reader :event_hash

  def clean_set
    unless retrieve_set.class == Array
      remove_extra_name(retrieve_set)
    else
      if retrieve_set.blank? || retrieve_set.first.first[0] != :@name
        retrieve_set
      else
        remove_extra_name(retrieve_set.first)
      end
    end
  end

  def retrieve_set
    sets = event_hash[:sets]

    if sets.blank?
      []
    else
      sets[:set]
    end
  end

  def remove_extra_name(hash)
    hash.delete_if { |key, value| key == :@name }
  end
end
