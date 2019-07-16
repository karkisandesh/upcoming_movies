class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :synopsis

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.movie_overview(input)
    UpcomingMovies::Scraper.new.scrape_details(input)
      @@all.each do |movie_data|
          #  binding.binding.pry
        puts movie_data.title
        puts movie_data.release_date
        puts movie_data.synopsis
   end
  end
end
