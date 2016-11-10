require "spec_helper"

RSpec.describe User, :type => :model do

  let!(:user) { create(:user) }
  
  it "check that user online" do
    expect(user.online?).to be true
  end

  it "check that user offline 5 min later" do
    user.updated_at = Time.now - 10.minutes
    expect(user.online?).to be false
  end
end