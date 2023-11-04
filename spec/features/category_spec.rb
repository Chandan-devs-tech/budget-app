require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '123456')
    @category = Category.new(name: 'Shopping', icon: 'shopping.png', author: @user)
  end

  describe 'Category index page' do
    it 'Shows category index page' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'user[name]', with: @user.name
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Sign up'
      expect(page).to have_content('Categories')
      click_link 'Add Category'
      fill_in 'category[name]', with: @category.name
      fill_in 'category[icon]', with: @category.icon
      click_button 'Create Category'
      expect(page).to have_content(@category.name)
      click_link @category.name
      expect(page).to have_content('Transactions')
    end
  end
end
