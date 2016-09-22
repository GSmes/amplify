require 'rails_helper'

RSpec.feature 'Playlist creation' do
  context 'logged in user' do
    scenario 'they select a setlist to create a playlist with' do
      log_in_user

      visit '/setlists?artist_name=David+Bowie'

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(setlists_path)

      # first(:button, "Create Playlist").click
      # save_and_open_page

    end
  end
end
