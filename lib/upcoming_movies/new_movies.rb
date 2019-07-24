class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :synopsis

  @@all = []

  def self.all
    @@all
  end

  def self.details(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def save
    @@all << self
  end
end
