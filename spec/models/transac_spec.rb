require 'rails_helper'

RSpec.describe Transac, type: :model do
  it 'Should allow the transaction with name,amount,author' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    transaction = Transac.new(name: 'paypal', amount: 100.00, author: user)
    expect(transaction).to be_valid
  end

  it 'Should not allow the transaction without name' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    transaction = Transac.new(amount: 100.00, author: user)
    expect(transaction).not_to be_valid
  end

  it 'Should not allow the transaction without amount' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    transaction = Transac.new(name: 'paypal', author: user)
    expect(transaction).not_to be_valid
  end

  it 'Should not allow the transaction without author' do
    User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    transaction = Transac.new(name: 'paypal', amount: 100.00)
    expect(transaction).not_to be_valid
  end
end
