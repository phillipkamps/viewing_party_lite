require "rails_helper"

RSpec.describe "Create new user page" do
  it "has working form" do
    visit "/register"

    fill_in "Name", with: "Pabu"
    fill_in "Email", with: "pabu@gmail.com"
    fill_in "Password", with: "qwerty"
    fill_in "Password confirmation", with: "qwerty"
    click_button "Register"

    expect(page).to have_content("Pabu")
  end
end
