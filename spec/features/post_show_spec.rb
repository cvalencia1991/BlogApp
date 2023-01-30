require 'rails_helper'
RSpec.describe Post, type: :system do
  describe 'show user page' do
    it 'I can see the posts title.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('post 1')
    end

    it 'I can see the posts title.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Tom')
    end

    it 'I can see the posts title.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Comments: 9')
    end

    it 'I can see how many likes it has.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Likes: 9')
    end

    it 'I can see the post body.' do
      visit user_post_path(1, 1)
      expect(page).to have_content('post 1')
    end

    it 'I can see the username of each commentor.' do
      visit user_post_path(1, 1)
      post = Post.includes(:comments, comments: [:author]).first
      post.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it 'I can see the comment each commentor left.' do
      visit user_post_path(1, 1)
      post = Post.includes(:comments, comments: [:author]).last
      comment = post.comments.first
      comment_post = comment.author.name.concat(':').concat(comment.text)
      expect(page).to have_content(comment_post)
    end
  end
end
