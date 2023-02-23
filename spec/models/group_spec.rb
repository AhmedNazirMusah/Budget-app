require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    user = User.create(name: 'Ahmed', email: 'ahmed@apple.com', password: '256984')
    @category1 = Group.create(name: 'Cities', icon: 'icon.com', user:)
  end

  context 'Test Validation' do
    it 'name should be present' do
      @category1.name = 'Cities'
      expect(@category1).to be_valid
    end

    it 'icon should not be nil' do
      @category1.icon = 'icon.com'
      expect(@category1).to be_valid
    end
  end
end
