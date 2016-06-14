require 'rails_helper'

RSpec.describe "User can search by zipcode", type: :feature do
  scenario "they can search zipcode and find stores within 25 miles" do
    search_zip = "80202"

    visit root_path

    within(".search-form") do
      fill_in "Zip Code", with: "#{search_zip}"
      click_button "search"
    end

    expect(page).to have_current_path search_path
    expect(page).to have_content("Stores within 25 miles of searched zipcode")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content
  end
end
