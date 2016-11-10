require "spec_helper"

describe "feature check chats", :type => :feature do
  
  let!(:user) { create(:user, email: "new2@name.com", password: "123456789") }

  before(:each) do
    visit new_user_registration_path
    fill_in "Email", with: "new3@name.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
    click_link "Create new chat"
    find(:css, "#chat_users_check_#{user.id}").set(true)
    click_button "Create Chat"
  end

  it "check that chat create" do
    expect(page).to have_content "Chat created successful"
  end

  it "check that messages send without reload pages" do
    fill_in "Field", with: "some text"
    expect(page).to have_content "some text"
  end

end