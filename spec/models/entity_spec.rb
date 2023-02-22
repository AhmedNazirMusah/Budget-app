require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
    @user = User.create(name: 'Ahmed', email: 'Ahmed@apple.com', password: '748122')
    @transaction = Entity.create(name: 'Pie', author: @user, amount: 15.99)
  end

  context 'Test validations' do
    it 'name should be present' do
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'author should be present' do
      expect(@transaction.author).to eq @user
    end

    it 'amount should be numeric' do
      @transaction.amount = 'hello'
      expect(@transaction).to_not be_valid
    end
  end
end