require 'rails_helper'

RSpec.describe MovieGenre, type: :model do
  describe "associations" do
    it "belongs to a movie" do
      movie_genre = MovieGenre.reflect_on_association(:movie)
      expect(movie_genre.macro).to eq(:belongs_to)
    end

    it "belongs to a genre" do
      movie_genre = MovieGenre.reflect_on_association(:genre)
      expect(movie_genre.macro).to eq(:belongs_to)
    end
  end
end
