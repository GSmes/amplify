require 'rails_helper'

RSpec.feature 'Setlist search' do
  context 'logged in user' do
    scenario 'they search using a valid query' do
      log_in_user

      click_link "Search for a setlist"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(search_path)

      fill_in "Artist Name", with: "Green Day"
      click_on "Find Setlists"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(setlists_path)

      within('.container') do
        expect(page).to have_content("Showing setlists matching \"Green Day\"")
        expect(page).to have_content("Venue: 41 Ocean Club")
        expect(page).to have_content("Location: Santa Monica, California, US")
        expect(page).to have_content("Date: 2015-11-05")
        expect(page).to have_content("American Idiot")
      end
    end

    scenario 'they search using an invalid query' do
      log_in_user

      click_link "Search for a setlist"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(search_path)

      fill_in "Artist Name", with: "0qfien"
      click_on "Find Setlists"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(setlists_path)

      within('.container') do
        expect(page).to have_content("Showing setlists matching \"0qfien\"")
        expect(page).to have_content("We could not find the band or artist you were looking for. Please try another search.")
      end
    end
  end
end
