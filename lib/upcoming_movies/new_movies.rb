class UpcomingMovies::New_movies

  attr_accessor :title, :release_date, :synopsis, :title_name, :href

  @@all = []

  def initialize(title_name, href)
    @title_name = title_name
    @href = href
    save
    binding.pry
  end

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
