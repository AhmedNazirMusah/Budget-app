require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user = User.new(name: 'Ahmed', email: 'ahmed@gmail.com', password: '123456')
    @user.save
    @category = Group.new(name: 'first category', icon: 'url for icon')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_button 'ADD CATEGORY'
    fill_in 'Name', with: @category.name
    fill_in 'URL for icon', with: @category.icon
    click_button 'CREATE'
  end

  it 'should validate transaction page' do
    click_on 'first category'
    expect(page).to have_content('Transactions')
  end

  it 'redirects to add new transaction' do
    click_on 'first category'
    click_button 'ADD TRANSACTION'
    expect(page).to have_current_path(new_entity_path)
  end

  it 'should save a new transaction' do
    click_on 'first category'
    click_button 'ADD TRANSACTION'
    fill_in 'Name', with: 'First transaction'
    fill_in 'Amount', with: 5
    first('#entity_group_id option', minimum: 1).select_option
    click_button 'ADD'
    expect(page).to have_content('First transaction')
  end
end
