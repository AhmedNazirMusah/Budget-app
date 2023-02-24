require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before :each do
    @user = User.new(name: 'Ahmed', email: 'Ahmed@gmail.com', password: '123456')
    @user.save
    visit new_user_session_path
  end

  it 'validate input fields' do
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_button 'Log in'
  end

  it 'validates login route' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect(page).to have_content('Categories')
  end
end
