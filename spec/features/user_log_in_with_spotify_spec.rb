require 'rails_helper'

RSpec.feature 'User logging in with Spotify' do
  context 'guest user visits the root path' do
    scenario 'they allow access to Spotify profile' do
      stub_omniauth

      visit root_path

      within('#topnavbar') do
        click_link "Login with Spotify"
      end

      expect(page.status_code).to eq(200)
      expect(page).to have_content("Welcome, Garrett.smestad!")

      within('#topnavbar') do
        expect(page).to have_link("Logout")
        expect(page).to have_content("Logged in as Garrett.smestad")
        expect(page).to_not have_content("Login with Spotify")
      end
    end
  end
end
