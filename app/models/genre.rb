class Genre < ApplicationRecord
  # Represents a genre of a movie
  # Validates the uniqueness and presence of a genre name
  validates :name, uniqueness: true, presence: true

  # Defines the many-to-many association with movies through the movie_genres join table
  has_many :movie_genres
  has_many :movies, through: :movie_genres
end
