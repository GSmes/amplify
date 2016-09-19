require 'rails_helper'

RSpec.feature 'User logging out' do
  context 'logged in user' do
    scenario 'they try to log out' do
      stub_omniauth

      visit root_path

      click_link "Log in with Spotify"

      expect(page).to have_content("Welcome, Garrett.smestad!")

      click_link "Log out"

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Log in with Spotify")
      expect(page).to_not have_content("Welcome, Garrett.smestad!")
      expect(page).to_not have_content("Log out")
    end
  end
end
