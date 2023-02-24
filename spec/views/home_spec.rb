require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    visit root_path
  end

  it 'Validate buttons on splash screen' do
    expect(page).to have_link 'Login'
    expect(page).to have_link 'Sign up'
  end

  it 'Validate login page' do
    click_on 'Login'
    expect(page).to have_current_path new_user_session_path
  end

  it 'validate sign up page' do
    click_on 'Sign up'
    expect(page).to have_current_path new_user_registration_path
  end
end
