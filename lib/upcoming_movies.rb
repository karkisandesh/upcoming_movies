require_relative "upcoming_movies/version"
require_relative "upcoming_movies/cli"
require_relative "upcoming_movies/new_movies"
require_relative "upcoming_movies/scraper"
require_relative "upcoming_movies/movie_data"

require 'pry'
require 'nokogiri'
require 'open-uri'

module UpcomingMovies
  class Error < StandardError; end
  # Your code goes here...
end
