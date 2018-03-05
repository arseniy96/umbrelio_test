class Rating < ApplicationRecord
  belongs_to :post

  validates :vote, presence: true
  validates_numericality_of :vote, less_than_or_equal_to: 5
  validates_numericality_of :vote, greater_than_or_equal_to: 1
end
