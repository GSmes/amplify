require 'rails_helper'

RSpec.describe 'setlist service' do
  describe '#artist_events' do
    context 'when searching by artist name' do
      it "should return all events by the artist" do
        VCR.use_cassette('setlist_service_artist_events') do
          results = SetlistService.new.artist_events('pearl-jam')

          expect(results.count).to eq(20)
        end
      end

      it "should return events with the artist, date, venue, and setlist" do
        VCR.use_cassette('setlist_service_artist_events') do
          results = SetlistService.new.artist_events('pearl-jam')
          event = results.first

          expect(event.artist).to eq('Pearl Jam')
        end
      end
    end

    #   it "returns an empty hash if no artist found" do
    #     VCR.use_cassette('songkick_service_artist_not_found') do
    #       artist = 'asdfasdfsdfasdf'
    #       artist_profile = Songkick::Service.new.artist_profile(artist)
    #
    #       expect(artist_profile).to eq({})
    #       expect(artist_profile[:id]).to eq(nil)
    #     end
    #   end
    # end
    #
    # context '#upcoming_events' do
    #   it "returns an artist's upcoming events by artist id" do
    #     VCR.use_cassette('songkick_service_upcoming_events') do
    #       artist_id = 403_540_6
    #       upcoming_events = Songkick::Service.new
    #                                          .upcoming_events(artist_id)
    #
    #       expect(upcoming_events.last[:type]).to eq('Concert')
    #       expect(upcoming_events.last[:displayName])
    #         .to eq(
    #           'Kishi Bashi with Laura Gibson at' \
    #           ' Variety Playhouse (November 2, 2016)'
    #         )
    #     end
    #   end
    # end
  end
end
