require 'rails_helper'
RSpec.describe User, type: :system do
  describe 'show user page' do
    it 'I can see the users profile picture.' do
      visit user_path(1)
      expect(page).to have_xpath("//img[@src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'I can see the users profile picture.' do
      visit user_path(1)
      expect(page).to have_content('Tom')
    end

    it 'I can see the number of posts each user has written.' do
      visit user_path(1)
      expect(page).to have_content('posts counters:4')
    end

    it 'I can see the users bio.' do
      visit user_path(1)
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'I can see the users first 3 posts.' do
      @posts = Post.where(author_id:1).limit(3).order(created_at: :desc)
      @posts.each do |post|
        visit user_path(1)
        expect(page).to have_content(post.title)
      end
    end

    it 'I can see a button that lets me view all of a users posts.' do
      visit user_path(1)
      expect(page).to have_content('See all Posts')
    end

    it 'When I click a users post, it redirects me to that posts show page.' do
      visit user_path(1)
      post_id = Post.last.id
      post_author = Post.last.author_id
      click_link "Post:4"
      expect(page).to have_current_path(user_post_path(post_author,post_id))

    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      visit user_path(1)
      click_link "See all Posts"
      expect(page).to have_current_path(user_posts_path(1))
    end
  end
end
