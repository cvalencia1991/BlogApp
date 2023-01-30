require 'rails_helper'
RSpec.describe User, type: :system do
  describe 'index page' do
    it 'I can see the username of all other users.' do
      visit users_path
      expect(page).to have_content('Lilly')
    end

    it 'I can see the profile picture for each user.' do
      visit users_path
      expect(page).to have_xpath("//img[@src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'I can see the number of posts each user has written.' do
      visit users_path
      expect(page).to have_content('posts counters:4')
    end

    it 'When I click on a user, I am redirected to that users show page.' do
      visit users_path
      click_link 'Tom'
      expect(page).to have_current_path(user_path(1))
    end
  end
end
