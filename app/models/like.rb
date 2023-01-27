class Like < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'authorid'
  belongs_to :post, class_name: 'Post', foreign_key: 'authorid'
  validates :postid, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :count_like

  def count_like
    counter = Like.where(postid:).count
    post.update(likescounter: counter)
  end
end
