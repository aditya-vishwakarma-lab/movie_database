# Movie Database Application

This is a Ruby on Rails application that fetches movie data from a public API, stores it in a relational database, and provides a user interface to query the data.

## Requirements

- Ruby (version 3.2.2)
- Rails (version 7.0.6)
- PostgreSQL (version 12.15)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/aditya-vishwakarma-lab/movie_database.git
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. Set up environment variables:

   - Rename the `.env.example` file to `.env`.
   - Edit the `.env` file and provide your TMDB API key.

## API Integration

This application integrates with the TMDB API to fetch movie data. Follow the steps below to set up the API integration:

1. Sign up for a TMDB API key at [https://www.themoviedb.org/documentation/api](https://www.themoviedb.org/documentation/api).

2. Set the TMDB API key in the `.env` file:

   ```plaintext
   TMDB_API_KEY=your-api-key
   ```

## Usage

1. Start the Rails server:

   ```bash
   rails server
   ```

2. Access the application in your browser at [http://localhost:3000](http://localhost:3000).

## API Summary

The chosen API for this Movie Database application is the TMDB (The Movie Database) API. TMDB is a popular online database that provides information about movies, including details such as titles, genres, release dates, overviews, ratings, and more.

The application integrates with the TMDB API to fetch movie data and populate the database. It uses the API's endpoints to retrieve a list of currently playing movies and their associated genres. The data obtained from the API is processed and stored in the application's database using the Ruby on Rails framework.

Here's an overview of how the application processes the data from the TMDB API:

1. **Fetch Movies:** The application makes an API request to the TMDB API's `/movie/now_playing` endpoint to fetch the list of currently playing movies. It specifies the language and region parameters to retrieve movies in a specific language and region.

2. **Fetch Genres:** The application also fetches the list of genres from the TMDB API's `/genre/movie/list` endpoint. This provides the mapping between genre IDs and their corresponding names.

3. **Data Processing:** Once the movie and genre data is obtained from the API, the application processes it by creating `Movie` and `Genre` records in the database. Each movie's title, overview, release date, vote average, and vote count are stored in the `movies` table. The genres associated with each movie are stored in the `genres` table, and the relationship between movies and genres is managed through the `movie_genres` join table.

4. **User Interface:** The application provides a user interface where users can view the list of movies and search for movies based on their titles. The movie data stored in the database is displayed on the web page, allowing users to browse through the movies and access detailed information for each movie.

By integrating with the TMDB API and processing the data obtained, the application ensures that the movie database is up to date with the latest information and provides users with an interactive interface to explore and search for movies.


## Testing

To run the test suite, execute the following command:

```bash
rspec
```
