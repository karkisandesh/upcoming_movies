class UpcomingMovies::New_movies

  #instance variable setter and getter methods
  attr_accessor :title_name, :href, :title, :release_date, :synopsis


  @@all = []

  def self.find(id)
    @@all[id.to_i - 1]
  end

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

  def details(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  # def details
  #   @title = title
  #   @release_date = release_date
  #   @synopsis = synopsis
  #   binding.pry
  # end

  # def self.details(title, release_date, synopsis)
  #   @title = title
  #   @release_date = release_date
  #   @synopsis = synopsis
  # end




end
