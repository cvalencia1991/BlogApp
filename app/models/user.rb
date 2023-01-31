class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_one_attached :photo
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :encrypted_password, presence: true

  def recents_post
    posts.limit(3).order(created_at: :desc)
  end
end
