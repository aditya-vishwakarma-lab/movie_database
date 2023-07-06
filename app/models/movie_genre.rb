class MovieGenre < ApplicationRecord
  # Represents the join table between movies and genres
  # Defines the many-to-many association between movies and genres
  belongs_to :movie
  belongs_to :genre
end
