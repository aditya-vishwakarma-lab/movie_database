class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  validates :title, uniqueness: true, presence: true
end
