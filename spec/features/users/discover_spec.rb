require "rails_helper"

RSpec.describe "Discover page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty") }

  before :each do
    visit "/"
    click_on "Log In"
    expect(current_path).to eq("/login")
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "qwerty"
    click_on "Log In"
    click_on "Discover Movies"
  end

  it "has button to discover top rated movies" do
    expect(current_path).to eq("/discover")
    click_button "Discover Top-Rated Movies"
    expect("The Shawshank Redemption").to appear_before("The Godfather")
  end

  it "can search by title" do
    fill_in :title, with: "Shawshank"
    click_button "Search"
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to_not have_content("The Godfather")
  end
end
