class User < ApplicationRecord
  has_many :likes, class_name: "Like"
  has_many :comments, class_name: "Comment"
  has_many :posts, class_name: "Posts"
end
