require "spec_helper"

describe "feature check user", :type => :feature do
  
  context "user registration" do

    it "check that user create" do
      visit new_user_registration_path
      fill_in "Email", with: "new@name.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context "user login/logout" do
    
    let!(:user) { create(:user, email: "new2@name.com", password: "1234567") }

    before(:each) do
      visit new_user_session_path
      fill_in "Email", with: "new2@name.com"
      fill_in "Password", with: "1234567"
      click_button "Log in"
    end

    it "check that user log in" do
      expect(page).to have_content "Signed in successfully."
    end

    it "check that user logout succesful" do
      click_link "Sign Out"
      expect(current_path).to eq new_user_session_path
    end
  end

  context "if user not logged in" do

    it "he can't see chats and other users" do
      visit root_path
      expect(page).not_to have_content "Your Chats"
    end
    
  end
end