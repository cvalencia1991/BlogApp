class Like < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'authorid'
  belongs_to :posts, class_name: 'Post', foreign_key: 'authorid'
end
