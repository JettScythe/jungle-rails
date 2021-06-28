require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password: "password",
        password_confirmation: "password")
      expect(user).to (be_valid)
    end

    it 'should have password and password confirmation' do
      user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password_confirmation: nil)
      expect(user).to_not (be_valid)
    end

    it 'should not save without unique email' do
      @user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password_digest: "test")
      @user2 = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password_digest: "test")
      expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password: "password",
        password_confirmation: "password123")
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have name to be a valid user' do
      user = User.create(
        firstname: nil,
        lastname: nil,
        email: "test@hotmail.com",
        password: "password",
        password_confirmation: "password")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 5' do
      user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password: "pass",
        password_confirmation: "pass"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should create valid user with authentication' do
    user = User.create(
      firstname: "Jett",
      lastname: "Scythe",
      email: "test@hotmail.com",
      password: "password",
      password_confirmation: "password")
    expect(User.authenticate_with_credentials('test@hotmail.com', 'password')).to eq(user)
    end

    it 'logs in user with correct email in uppercase' do
      user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password: "password",
        password_confirmation: "password")
      expect(User.authenticate_with_credentials('TEST@hotmail.com', 'password')).to eq(user)
    end

    it 'logs in user with correct email and spaces' do
      user = User.create(
        firstname: "Jett",
        lastname: "Scythe",
        email: "test@hotmail.com",
        password: "password",
        password_confirmation: "password")      
      expect(User.authenticate_with_credentials(' test@hotmail.com ', 'password')).to eq(user)
    end

  end
end
