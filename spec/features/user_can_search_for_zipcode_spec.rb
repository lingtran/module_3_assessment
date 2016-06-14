require 'rails_helper'

RSpec.describe "User can search by zipcode", type: :feature do
  scenario "they can search zipcode and find stores within 25 miles" do
    search_zip = "80202"

    visit root_path

    within("#search-form") do
      fill_in "Zip Code", with: "#{search_zip}"
      click_button "Search"
    end

    expect(page).to have_current_path '/search'

    within("#store-info") do
      expect(page).to have_content("Long Name")
      expect(page).to have_content("City")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Phone Number")
      expect(page).to have_content("Store Type")
    end

    expect(page).to have_content("Stores within 25 miles of searched zipcode")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("Showing: 15 total stores")
    expect(page).to have_content("Next Page")
  end
end
