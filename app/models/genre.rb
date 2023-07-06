class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates :name, uniqueness: true, presence: true
end
