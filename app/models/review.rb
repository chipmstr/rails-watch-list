class Review < ApplicationRecord
  belongs_to :movie

  # validation for rating and comment
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "Rating must be between 1 and 5"
  }
  validates :comment, presence: true, length: { minimum: 6 }
end
