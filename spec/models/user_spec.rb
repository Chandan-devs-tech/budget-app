require 'rails_helper'

RSpec.describe User, type: :model do
    it "Should allow user with name,email,password" do
      user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '1234567')    
      expect(user).to be_valid
    end

    it "Should not allow user without name" do
      user = User.new(name: 'Chand')
      expect(user).not_to be_valid
    end

    it "Should not allow user without email" do
      user = User.new(email: 'chand@gmail.com')
      expect(user).not_to be_valid
    end

    it "Should not allow user without password" do
      user = User.new(password: '12345')
      expect(user).not_to be_valid
    end
  end
