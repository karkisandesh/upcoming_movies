class UpcomingMovies::New_movies

  attr_accessor :title_name, :href

  @@all = []

  def initialize(title, href)
    @title_name = title
    @href = href
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # def self.details
  #   @title = title
  #   @release_date = release_date
  #   @synopsis = synopsis
  # end

  # def self.details(title, release_date, synopsis)
  #   @title = title
  #   @release_date = release_date
  #   @synopsis = synopsis
  # end

  # def self.details(attributes)
  #   attributes.each do |key, value|
  #     self.send("#{key}=", value)
  #   end
  # end


end
