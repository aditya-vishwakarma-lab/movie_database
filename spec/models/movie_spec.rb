require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it "is valid with a title" do
      movie = Movie.new(title: "Movie 1")
      expect(movie).to be_valid
    end

    it "is invalid without a title" do
      movie = Movie.new
      expect(movie).to be_invalid
      expect(movie.errors[:title]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has and belongs to many genres" do
      movie = Movie.reflect_on_association(:genres)
      expect(movie.macro).to eq(:has_many)
    end
  end
end
