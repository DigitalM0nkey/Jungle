require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be created with a password and password_confirmation fields" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW1234567", password_confirmation: "PW1234567")
      expect(user).to be_valid 
    end
    it "should not be valid if password fields do not match" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW1234567", password_confirmation: "PW4321567")
      expect(user).to_not be_valid 
    end
    it "should not be valid if password is missing" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: nil, password_confirmation: "PW4321567")
      expect(user).to_not be_valid 
    end
    it "should not allow two users with the same email address" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test1@test.com", password: "PW1234567", password_confirmation: "PW1234567")
      user.save
      user2 = User.new(first_name: "Bobby", last_name: "Rocket", email: "test1@test.COM", password: "PW1234567", password_confirmation: "PW1234567")
      expect(user2).to_not be_valid 
    end
    it "should not be valid if email, first name or last name are blank" do
      user = User.new(first_name: nil, last_name: "Kuiper", email: "test@test.com", password: "PW1234567", password_confirmation: "PW1234567")
      expect(user).to_not be_valid
      user = User.new(first_name: "Terrence", last_name: nil, email: "test1@test.com", password: "PW1234567", password_confirmation: "PW1234567")
      expect(user).to_not be_valid
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: nil, password: "PW1234567", password_confirmation: "PW1234567")
      expect(user).to_not be_valid
    end
    it "should not be valid is password is under 7 characters" do
      user = User.new(first_name: nil, last_name: "Kuiper", email: "test@test.com", password: "12345", password_confirmation: "12345")
      expect(user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it "should be valid if user is authenticated" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW123456789", password_confirmation: "PW123456789")
      user.save
      user = User.authenticate_with_credentials("test@test.com","PW123456789")
      puts('USER', user.inspect)
      expect(user).to_not be_nil
    end
    it "should be valid if user is has leading or trailing space around email " do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW123456789", password_confirmation: "PW123456789")
      user.save
      user = User.authenticate_with_credentials("   test@test.com   ","PW123456789")
      expect(user).to_not be_nil
    end
    it "should be valid if user can't write email like a normal person" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW123456789", password_confirmation: "PW123456789")
      user.save
      user = User.authenticate_with_credentials("tESt@Test.coM","PW123456789")
      
      expect(user).to_not be_nil
    end
    it "should not be valid if user is not authenticated" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW123456789", password_confirmation: "PW123456789")
      user.save
      user = User.authenticate_with_credentials("test@test.com","PW123456")
      expect(user).to be_nil
    end
    it "should not be valid if user is not authenticated" do
      user = User.new(first_name: "Terrence", last_name: "Kuiper", email: "test@test.com", password: "PW123456789", password_confirmation: "PW123456789")
      user.save
      user = User.authenticate_with_credentials("test@test.ca","PW123456789")
      expect(user).to be_nil
    end
  end


end
