class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  validates :post_id, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :count_like

  def count_like
    counter = Like.where(post_id:).count
    post.update(likes_counter: counter)
  end
end
