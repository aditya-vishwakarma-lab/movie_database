require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "validations" do
    it "is valid with a name" do
      genre = Genre.new(name: "Action")
      expect(genre).to be_valid
    end

    it "is invalid without a name" do
      genre = Genre.new
      expect(genre).to be_invalid
      expect(genre.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a duplicate name" do
      Genre.create(name: "Action")
      genre = Genre.new(name: "Action")
      expect(genre).to be_invalid
      expect(genre.errors[:name]).to include("has already been taken")
    end
  end

  describe "associations" do
    it "has and belongs to many movies" do
      genre = Genre.reflect_on_association(:movies)
      expect(genre.macro).to eq(:has_many)
    end
  end
end
