class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postid'
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  after_save :upadate_comments

  def upadate_comments
    counter = Comment.count('postid')
    Post.update(commentscounter: counter)
  end
end
