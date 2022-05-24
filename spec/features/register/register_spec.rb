require "rails_helper"

RSpec.describe "Register page" do
  it "can authenticate a new user" do
    visit "/register"

    fill_in :name, with: "Frodo Baggins"
    fill_in :email, with: "frodo@midearth.net"
    fill_in :password, with: "ilovesam"
    fill_in :password_confirmation, with: "ilovesam"

    click_on "Register"
    expect(User.last.name).to eq("Frodo Baggins")
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, Frodo Baggins!")
  end

  it "displays appropriate sad path message/behavior during failed authentication" do
    visit "/register"

    fill_in :name, with: "Frodo Baggins"
    fill_in :email, with: "frodo@midearth.net"
    fill_in :password, with: "ilovesam"
    fill_in :password_confirmation, with: "ilovegandalf"

    click_on "Register"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
