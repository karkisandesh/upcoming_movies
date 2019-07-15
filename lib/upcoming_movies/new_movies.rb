class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :synopsis

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
