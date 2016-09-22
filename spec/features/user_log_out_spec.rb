require 'rails_helper'

RSpec.feature 'User logging out' do
  context 'logged in user' do
    scenario 'they try to log out' do
      log_in_user

      within('#topnavbar') do
        click_link "Logout"
      end

      expect(page.status_code).to eq(200)
      expect(page).to_not have_content("Welcome, Garrett.smestad!")

      within('#topnavbar') do
        expect(page).to have_link("Login with Spotify")
        expect(page).to_not have_content("Logged in as Garrett.smestad")
        expect(page).to_not have_content("Logout")
      end
    end
  end
end
