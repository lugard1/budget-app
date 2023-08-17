require 'rails_helper'

RSpec.describe 'Categories Views', type: :feature do
  describe 'after log in' do
    before(:each) do
      @user1 = User.create(name: 'Lugard', email: 'lugard@lion.com', password: '123456')
      @category1 = Category.create(name: 'Car', icon: 'www.unsplash.com', user_id: @user1.id)
      @category2 = Category.create(name: 'Auto', icon: 'www.splash.com', user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'lugard@lion.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit categories_path
    end

    it 'displays Categories on the navbar' do
      expect(page).to have_content 'Categories'
    end

    it 'displays a list of the categories' do
      expect(page).to have_content 'Car'
      expect(page).to have_content 'Auto'
    end

    it 'has a button to add new category' do
      expect(page).to have_content 'Add New Category'
    end

    it 'should take you to add category form when clicking on the button' do
      click_on 'Add New Category'
      expect(current_path).to eql new_category_path
    end
  end
end