require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get '/movies'
      expect(response).to have_http_status(200)
    end

    it "displays the movie titles" do
      # Assuming you have movies in your database
      movie1 = Movie.create(title: "Movie 1")
      movie2 = Movie.create(title: "Movie 2")

      get '/movies'
      expect(response.body).to include(movie1.title)
      expect(response.body).to include(movie2.title)
    end
  end
end
