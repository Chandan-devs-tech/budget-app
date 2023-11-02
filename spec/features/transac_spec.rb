require 'rails_helper'

RSpec.feature 'Transacs', type: :feature do
  before :each do
    @user = User.new(name: 'Chandan', email: 'chandan@gmail.com', password: '123456')
    @category = Category.new(name: 'Exercise', icon: 'exercise.png', author: @user)
    @transac = Transac.new(name: 'Transaction 1', amount: 2000, author: @user)
  end

  describe 'Transactions index page' do
    it 'Should show the transactions page' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'user[name]', with: @user.name
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Sign up'
      click_link 'Add Category'
      fill_in 'category[name]', with: @category.name
      fill_in 'category[icon]', with: @category.icon
      click_button 'Create Category'
      click_link @category.name
      expect(page).to have_content('Transactions')
      click_link 'Add transaction'
      fill_in 'transac[name]', with: @transac.name
      fill_in 'transac[amount]', with: @transac.amount
      click_button 'Save'
      expect(page).to have_content(@transac.name)
      click_link 'Back to catgories'
      expect(page).to have_content('Categories')
    end
  end
end
