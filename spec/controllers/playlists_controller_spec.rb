require 'rails_helper'

RSpec.describe PlaylistsController, type: :request do
  describe 'POST create' do
    it 'should successfully create a playlist' do
      VCR.use_cassette('playlist_controller_create') do
        # code
      end
    end
  end
end
