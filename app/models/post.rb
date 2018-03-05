class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings

  validates :title, presence: true
  validates :text, presence: true

  scope :top, -> (n) {where("posts.id in (select post_id from ratings)").group('posts.id').joins(:ratings).order('AVG(ratings.vote) DESC').limit(n)}
end
