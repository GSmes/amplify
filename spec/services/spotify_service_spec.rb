require 'rails_helper'

RSpec.describe 'spotify service' do
  xdescribe '#new_playlist' do
    # context 'when searching by artist name' do
    #   it "should return all events by the artist" do
    #     VCR.use_cassette('setlist_service_artist_events') do
    #       results = SetlistService.new.artist_events('pearl-jam')
    #
    #       expect(results.count).to eq(20)
    #     end
    #   end
    #
    #   it "should return events with all event info" do
    #     VCR.use_cassette('setlist_service_artist_events') do
    #       results = SetlistService.new.artist_events('pearl-jam')
    #       event = results.first
    #
    #       expect(event[:artist][:@name]).to eq('Pearl Jam')
    #       expect(event.has_key?(:@eventDate)).to eq(true)
    #       expect(event.has_key?(:venue)).to eq(true)
    #       expect(event.has_key?(:sets)).to eq(true)
    #     end
    #   end
    # end
  end
end
