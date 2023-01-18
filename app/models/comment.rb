class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'postid'
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
end
