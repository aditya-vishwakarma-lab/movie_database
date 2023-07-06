require 'net/http'
require 'json'
require 'uri'

class TmdbService
  API_BASE_URL = 'https://api.themoviedb.org/3'.freeze

  def initialize(api_key)
    @api_key = api_key
  end

  # Fetches the latest now-playing movies from the TMDB API and stores them in the database
  def fetch_movies
    url = URI("#{API_BASE_URL}/movie/now_playing?language=hi&page=1&region=IN")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['Accept'] = 'application/json'
    request['Authorization'] = "Bearer #{@api_key}"

    response = http.request(request)
    movies_data = JSON.parse(response.body)['results']
    genre_mapping = fetch_genres['genre_mapping']

    # Process each movie and create records in the database
    movies_data.each do |movie_info|
      movie = Movie.create(
        title: movie_info['title'],
        overview: movie_info['overview'],
        release_date: movie_info['release_date'],
        vote_average: movie_info['vote_average'],
        vote_count: movie_info['vote_count']
      )

      # Associate genres with the movie based on genre IDs
      movie_info['genre_ids'].each do |api_genre_id|
        db_genre_id = genre_mapping[api_genre_id]
        genre = Genre.find_by(id: db_genre_id)
        movie.genres << genre if genre
      end
    end
  end

  # Fetches the list of available genres from the TMDB API and stores them in the database
  def fetch_genres
    url = URI("#{API_BASE_URL}/genre/movie/list?language=en")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['Accept'] = 'application/json'
    request['Authorization'] = "Bearer #{@api_key}"

    response = http.request(request)
    genres_data = JSON.parse(response.body)['genres']
    genre_mapping = {}

    # Process each genre and create records in the database
    genres_data.each do |genre_info|
      genre = Genre.create(
        name: genre_info['name']
      )
      genre_mapping[genre_info['id']] = genre.id
    end

    # Return the genres data and genre mapping
    {
      "genres_data" => genres_data,
      "genre_mapping" => genre_mapping
    }
  end
end
