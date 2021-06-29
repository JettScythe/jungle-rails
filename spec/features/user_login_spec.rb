require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user =
      User.create!(
        firstname: 'Jett',
        lastname: 'Scythe',
        email: 'test@hotmail.com',
        password: 'password',
        password_confirmation: 'password')
  end

  scenario 'They can login with valid user credentials' do
    visit login_path

    fill_in 'email', with: 'test@hotmail.com'
    fill_in 'password', with: 'password'

    click_on 'Submit'

    expect(page).to have_content('Logout')
    save_screenshot
  end
end