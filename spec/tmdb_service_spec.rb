require 'dotenv/load'
require 'rails_helper'

RSpec.describe TmdbService, type: :service do
  describe '#fetch_movies' do
    it 'returns an array of movie results' do
      tmdb_service = TmdbService.new(ENV['TMDB_API_KEY'])
      movies = tmdb_service.fetch_movies
      # pp movies
      # binding.pry
      expect(movies).to be_an(Array)
    end
  end


  describe '#fetch_genres' do
    it 'returns an array of movie results' do
      tmdb_service = TmdbService.new(ENV['TMDB_API_KEY'])
      genres = tmdb_service.fetch_genres
      # pp genres
      expect(genres).to be_an(Hash)
    end
  end
end
