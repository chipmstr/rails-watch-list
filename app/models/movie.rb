class Movie < ApplicationRecord
  # a movie has many reviews
  has_many :reviews, dependent: :destroy

  # remove rating validation, as we now handle ratings through reviews
end
