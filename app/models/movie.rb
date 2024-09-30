class Movie < ApplicationRecord
  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "must be between 1 and 5"
  }

  # Add other validations and associations as needed
end
