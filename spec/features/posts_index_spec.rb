require 'rails_helper'
RSpec.describe Post, type: :system do
  describe 'post index user page' do
    it 'I can see the profile picture for each user.' do
      visit user_posts_path(1)
      expect(page).to have_xpath("//img[@src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'I can see the users username.' do
      visit user_posts_path(1)
      expect(page).to have_content('Tom')
    end

    it 'I can see the number of posts each user has written.' do
      visit user_posts_path(1)
      expect(page).to have_content('posts counters:4')
    end

    it 'I can see a posts title.' do
      visit user_posts_path(1)
      expect(page).to have_content('Post:1')
    end

    it 'I can see some of the posts body.' do
      visit user_posts_path(1)
      expect(page).to have_content('post 1')
    end

    it 'I can see the first comments on a post.' do
      visit user_posts_path(1)
      post_id_first = Post.first.id
      author_id_post = Post.first.author_id
      comment = Comment.where(author_id: author_id_post, post_id: post_id_first).first
      expect(page).to have_content(comment.text)
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(1)
      expect(page).to have_content('comments:9')
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(1)
      expect(page).to have_content('likes: 9')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(1)
      expect(page).to have_content('pagination')
    end

    it 'When I click on a post, it redirects me to that posts show page.' do
      visit user_posts_path(1)
      click_link 'Post:1 post 1'
      expect(page).to have_current_path(user_post_path(1, 1))
    end
  end
end
