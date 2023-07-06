require 'dotenv/load'
class MoviesController < ApplicationController
  def index
    load_movies_in_db
    @movies = Movie.all
  end

  def show
    @movie = Movie.includes(:genres).find(params[:id])
  end

  def search
    search_param = params[:search]
    @movies = Movie.where("title LIKE ?", "%#{search_param}%")
  end

  private

  def load_movies_in_db
    tmdb_service = TmdbService.new(ENV['TMDB_API_KEY'])
    tmdb_service.fetch_movies
  end
end
