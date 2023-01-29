class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :post_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :upadate_comments

  def upadate_comments
    counter = Comment.where(post_id:).count
    post.update(comments_counter: counter)
  end
end
