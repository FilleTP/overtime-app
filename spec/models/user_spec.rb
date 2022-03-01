require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@testing.com", password: "something", password_confirmation: "something", first_name: "Jon", last_name: "Persson")
    end
    it "can be created" do
      expect(@user).to be_valid
    end
    it "cannot be created without a first_name, last_name" do
      @user.first_name = nil
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
  end
end
