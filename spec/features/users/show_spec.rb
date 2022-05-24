require "rails_helper"

RSpec.describe "user dashboard page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty") }

  before :each do
    visit "/"
    click_on "Log In"
    expect(current_path).to eq("/login")
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "qwerty"
    click_on "Log In"
  end

  describe "user show" do
    it "has button to discover movies" do
      visit "/dashboard"

      click_button "Discover Movies"

      expect(current_path).to eq("/discover")
    end

    it "has section that lists viewing parties" do
      visit "dashboard"

      expect(page).to have_content("Viewing Parties")
    end
  end
end
