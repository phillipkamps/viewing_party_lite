require "rails_helper"

RSpec.describe "Register page" do
  # let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com") }

  it "has has appropriate form" do
    visit "/register"
    expect(page).to have_field("Name")
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_field("Password confirmation")
    # fill_in("Name") with("Frodo")
    # fill_in("Email") with("frodo.baggins@midearth.net")
    # fill_in("Password") with("ilovesam")
    # fill_in("Password confirmation") with("ilovesam")
  end
end
