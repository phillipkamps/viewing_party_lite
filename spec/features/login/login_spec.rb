require "rails_helper"

RSpec.describe "Login page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty") }

  it "can log in a registered user" do
    visit "/"
    click_on "Log In"
    expect(current_path).to eq("/login")
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "qwerty"
    click_on "Log In"
    expect(current_path).to eq("/dashboard")
  end

  it "can handle login sad path" do
    visit "/login"
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "password123"
    click_on "Log In"
    expect(current_path).to eq("/login")
    expect(page).to have_content("Invalid email or password")
  end
end
