require 'dotenv/load'
class MoviesController < ApplicationController
  # Renders the index page and fetches movies from the TMDB API
  def index
    load_movies_in_db
    @movies = Movie.all
  end

  # Renders the show page and retrieves a specific movie by ID
  def show
    @movie = Movie.includes(:genres).find(params[:id])
  end

  # Performs a search query and renders the search results
  def search
    search_param = params[:search]
    @movies = Movie.where("title LIKE ?", "%#{search_param}%")
  end

  private

  # Loads movies from the TMDB API into the database
  def load_movies_in_db
    tmdb_service = TmdbService.new(ENV['TMDB_API_KEY'])
    tmdb_service.fetch_movies
  end
end
