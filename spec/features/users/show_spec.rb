require "rails_helper"

RSpec.describe "user dashboard page" do
  describe "user show" do
    it "has button to discover movies" do
      @user = User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty")
      visit "/users/#{@user.id}"

      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
    it "has section that lists viewing parties" do
      @user = User.create!(name: "Pabu", email: "pabu@email.com", password: "qwerty", password_confirmation: "qwerty")
      visit "/users/#{@user.id}"

      expect(page).to have_content("Viewing Parties")
    end
  end
end
