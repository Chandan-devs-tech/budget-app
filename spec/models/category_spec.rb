require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Should allow the category with name,icon,author' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    category = Category.new(name: 'Clothing', icon: 'icon.jpeg', author: user)
    expect(category).to be_valid
  end

  it 'Should not allow the category without name' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    category = Category.new(icon: 'icon.jpeg', author: user)
    expect(category).not_to be_valid
  end

  it 'Should not allow the category without icon' do
    user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    category = Category.new(name: 'Clothing', author: user)
    expect(category).not_to be_valid
  end

  it 'Should not allow the category without author' do
    User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')
    category = Category.new(name: 'Clothing', icon: 'icon.jpeg')
    expect(category).not_to be_valid
  end
end
