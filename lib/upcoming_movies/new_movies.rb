class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :length_of_movie, :synopsis, :full_synopsis

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
