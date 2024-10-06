class Movie < ApplicationRecord
  # a movie has many reviews
  has_many :reviews, dependent: :destroy

  # Attach an image to the movie
  has_one_attached :image

  # Validations for required fields
  validates :title, presence: true
  validates :overview, presence: true
  validates :poster_url, presence: true
end
