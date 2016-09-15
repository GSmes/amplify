require 'rails_helper'

RSpec.feature 'User logs in with Spotify' do
  context 'new user grants access to Spotify profile' do
    scenario 'they visit the root path' do
      auth_data = {
          'provider' => 'spotify',
          'info'     => {
            'display_name' => 'Fake User',
            'id'           => '12345'
          }
        }

      OmniAuth.config.mock_auth[:spotify] = auth_data

      visit root_path

      click_link "Log in with Spotify"

      expect(page).to have_content("Log out")
      expect(page).to have_content(auth_data['info']['display_name'])
      expect(page).to_not have_content("Log in with Spotify")
    end
  end
end
