require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be created with a password and password_confirmation fields" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW1234", password_confirmation: "PW1234")
      expect(user).to be_valid 
    end
    it "should not be valid if password fields do not match" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW1234", password_confirmation: "PW4321")
      expect(user).to_not be_valid 
    end
    it "should not be valid if password is missing" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: nil, password_confirmation: "PW4321")
      expect(user).to_not be_valid 
    end
    it "should not allow two users with the same email address" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test1@test.com", password: "PW1234", password_confirmation: "PW1234")
      user.save
      puts user.inspect
      user2 = User.new(first_name: "Bobby", last_name: "Rocket", email: "test1@test.COM", password: "PW1234", password_confirmation: "PW1234")
      puts user2.inspect
      expect(user2).to_not be_valid 
    end
    it "should not be valid if email, first anme or last name are blank" do
      user = User.new(first_name: nil, last_name: "Kuiper", email: "test@test.com", password: "PW1234", password_confirmation: "PW1234")
      expect(user).to_not be_valid
      user = User.new(first_name: "Terrence", last_name: nil, email: "test1@test.com", password: "PW1234", password_confirmation: "PW1234")
      expect(user).to_not be_valid
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: nil, password: "PW1234", password_confirmation: "PW1234")
      expect(user).to_not be_valid
    end
  end
end
