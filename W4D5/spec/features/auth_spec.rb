require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before(:each) do
    User.create!({user_name: "yungthug4", password: "password"})
  end
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before (:each) do
      visit new_user_url
      fill_in 'user_name', :with => 'yungthug4'
      fill_in 'password', :with => 'password'
      click_on "Create User"
    end
    let(:user) { FactoryGirl.create(:user) }

    scenario "shows username on the homepage after signup" do
      visit user_url(user)
      expect(page).to have_content "Welcome #{user.user_name}!"
    end
  end

end

feature "logging in" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "shows username on the homepage after login" do
    login_as(user)

    expect(page).to have_content "Hello #{user.user_name}"
  end
end

feature "logging out" do

  scenario "begins with a logged out state"

  scenario "doesn't show username on the homepage after logout"

end
