require 'rails_helper'

RSpec.describe 'Categories page', type: :feature do
  before :each do
    @user = User.new(name: 'Ahmed', email: 'ahmed@gmail.com', password: '123456')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'Validate categories title' do
    expect(page).to have_content('Categories')
  end

  it 'redirects to add new category' do
    click_button 'ADD CATEGORY'
    expect(page).to have_current_path(new_group_path)
  end

  it 'should save a new category' do
    click_button 'ADD CATEGORY'
    fill_in 'Name', with: 'First cat'
    fill_in 'URL for icon', with: 'url'
    click_button 'CREATE'
    expect(page).to have_content('First cat')
  end
end
