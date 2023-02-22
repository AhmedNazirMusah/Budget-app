require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Ahmed', email: 'test@apple.com', password: '123654')
  end

  context 'Validate name' do
    it 'Name should return present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'Name should return Ahmed' do
      expect(@user).to be_valid
    end
  end
end