class Post < ApplicationRecord
belongs_to :author, class_name: "User", foreign_key: "authorid"
has_many :comments, class_name: "Comment", foreign_key: "authorid"
has_many :likes, class_name: "Like"
end
