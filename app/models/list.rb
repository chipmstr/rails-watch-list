class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true

  # Active Storage: Allows each list to have one attached photo
  has_one_attached :photo
end
