require "rails_helper"

RSpec.describe "Register page" do
  it "has has appropriate form" do
    visit "/register"

    fill_in :name, with: "Frodo Baggins"
    fill_in :email, with: "frodo@midearth.net"
    fill_in :password, with: "ilovesam"
    fill_in :password_confirmation, with: "ilovesam"

    click_on "Register"

    expect(User.count).to eq(1)
    expect(current_path).to eq("/users/#{User.last.id}")
  end
end
