require "rails_helper"

RSpec.describe "Landing page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty") }
  let!(:loki) { User.create!(name: "Loki", email: "loki@email.com", password: "qwerty", password_confirmation: "qwerty") }
  let!(:thor) { User.create!(name: "Thor", email: "thor@email.com", password: "qwerty", password_confirmation: "qwerty") }
  let!(:ian) { User.create!(name: "Ian", email: "ian@email.com", password: "qwerty", password_confirmation: "qwerty") }
  let!(:phillip) { User.create!(name: "Phillip", email: "phillip@email.com", password: "qwerty", password_confirmation: "qwerty") }

  before :each do
    visit "/"
    click_on "Log In"
    fill_in :email, with: "pabu@email.com"
    fill_in :password, with: "qwerty"
    click_on "Log In"
    visit "/"
  end

  it "has authenticated user page" do
    expect(page).to have_content("Viewing Party Lite")

    expect(page).to have_content("loki@email.com")
    expect(page).to have_content("thor@email.com")
    expect(page).to have_content("ian@email.com")
    expect(page).to have_content("phillip@email.com")

    expect(page).to_not have_button("Log In")
    expect(page).to_not have_button("Create New User")

    click_link "Landing Page"
    expect(current_path).to eq("/")
  end

  it "has log out functionality" do
    click_button("Log Out")
    expect(current_path).to eq("/")
    expect(page).to_not have_content("loki@email.com")
    expect(page).to_not have_content("thor@email.com")
    expect(page).to_not have_content("ian@email.com")
    expect(page).to_not have_content("phillip@email.com")
    expect(page).to have_button("Log In")
    expect(page).to have_button("Create New User")
  end
end
