require "rails_helper"

RSpec.describe "movie detail page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty") }
  let!(:movie) { MovieService.get_movie(550) }

  before :each do
    visit "/"
    click_on "Log In"
    expect(current_path).to eq("/login")
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "qwerty"
    click_on "Log In"
    visit "/movies/550"
  end

  describe "movie show" do
    it "has button to create party" do
      click_button "Create Viewing Party"

      expect(current_path).to eq("/movies/#{movie[:id]}/viewing-party/new")
    end

    it "has button to return to discover" do
      click_button "Discover Page"

      expect(current_path).to eq("/discover")
    end

    it "shows movie information" do
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("8.4")
      expect(page).to have_content("2 hours 19 minutes")
      expect(page).to have_content("Drama")
      expect(page).to have_content("A ticking-time-bomb")
      expect("Edward Norton").to appear_before("David Andrews")
      expect(page).to have_content(movie[:vote_count])

      within("#Goddard") do
        expect(page).to have_content("Goddard")
        expect(page).to have_content("Pretty awesome movie")
      end
    end
  end
end
