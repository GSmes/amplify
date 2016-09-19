require 'rails_helper'

RSpec.feature 'User logging in with Spotify' do
  context 'guest user visits the root path' do
    scenario 'they allow access to Spotify profile' do
      stub_omniauth

      visit root_path

      click_link "Log in with Spotify"

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Log out")
      expect(page).to have_content("Welcome, Garrett.smestad!")
      expect(page).to_not have_content("Log in with Spotify")
    end

    xscenario 'they deny access to Spotify profile' do
      # stub_omniauth
      #
      # visit root_path
      #
      # click_link "Log in with Spotify"
      #
      # expect(page.status_code).to eq(200)
      # expect(page).to have_content("Log out")
      # expect(page).to have_content("Welcome, Garrett.smestad!")
      # expect(page).to_not have_content("Log in with Spotify")
    end
  end
end
