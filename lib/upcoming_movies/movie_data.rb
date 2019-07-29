class UpcomingMovies::Movie_data

  attr_accessor :title, :release_date, :synopsis
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(title, release_date, synopsis)
    @title = title
    @release_date = release_date
    @synopsis = synopsis
    save
  end



  # def self.details(attributes)
  #   attributes.each do |key, value|
  #     self.send("#{key}=", value)
  #   end
  # end

end
