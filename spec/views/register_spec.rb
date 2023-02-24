require 'rails_helper'

RSpec.describe 'Register page', type: :feature do
  before :each do
    @user = User.new(name: 'Ahmed', email: 'ahmed@gmail.com', password: '123456', password_confirmation: '123456')
    visit new_user_registration_path
  end

  it 'validates input fields on register page' do
    expect(page).to have_field 'Full name'
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Confirm Password'
    expect(page).to have_button 'Next'
  end

  it 'validate user sign up route' do
    fill_in 'Full name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Confirm Password', with: @user.password_confirmation
    click_button 'Next'
    expect(page).to have_content('Categories')
  end
end
