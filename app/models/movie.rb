class Movie < ApplicationRecord
  # a movie has many reviews
  has_many :reviews, dependent: :destroy

  # remove rating validation, as we now handle ratings through reviews

  # Attach an image to the movie
  has_one_attached :image
end
