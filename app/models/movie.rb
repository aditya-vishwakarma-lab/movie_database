class Movie < ApplicationRecord
  # Represents a movie
  # Validates the uniqueness and presence of a title
  validates :title, uniqueness: true, presence: true

  # Defines the many-to-many association with genres through the movie_genres join table
  has_many :movie_genres
  has_many :genres, through: :movie_genres
end
