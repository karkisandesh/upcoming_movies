class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :synopsis

  @@all = []

  def self.all
    @@all
  end

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end
end
