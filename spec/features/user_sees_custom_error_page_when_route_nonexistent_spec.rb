require 'rails_helper'

RSpec.feature "user sees custom routing error page" do
  scenario "user navigates to a route that does not exist" do
    visit '/ownjkefds'

    expect(current_path).to eq('/ownjkefds')

    expect(page).to have_content("It looks like you've made your way to a page \
                                  that doesn't exist. Return to the home page.")
    expect(page).to have_link "home page"
  end
end
