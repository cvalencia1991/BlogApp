class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  has_many :comments, class_name: 'Comment', foreign_key: 'postid'
  has_many :likes, class_name: 'Like', foreign_key: 'postid'
  after_save :update_post

  def update_post
    counter = Post.count('authorid')
    User.update(postscounter: counter)
  end

  def recents_comments
    Comment.order('created_at Desc').limit(5)
  end
end
