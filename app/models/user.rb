class User < ApplicationRecord
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'
  has_many :posts, class_name: 'Posts'
  validate :name_not_blank
  validate :postscounter_valid

  def postscounter_valid
    return if postscounter.is_a?(Integer) && postscounter >= 0

    errors.add(:postscounter, 'must be an integer greater than or equal to zero')
  end

  def name_not_blank
    return unless name.blank?

    errors.add(:name, "can't be blank")
  end

  def recents_post
    Post.limit(3).order(created_at: :desc)
  end
end
