class User < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'authorid'
  has_many :comments, class_name: 'Comment', foreign_key: 'authorid'
  has_many :posts, class_name: 'Post', foreign_key: 'authorid'
  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recents_post
    posts.limit(3).order(created_at: :desc)
  end
end
