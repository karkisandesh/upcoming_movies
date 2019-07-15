class UpcomingMovies::Scraper

  @@all = []

  def self.all
    @@all
  end

  def save
   @@all << self
 end

  def scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))

    movies = doc.css("ul.inline-items.panel.footer-coming-soon--list a").text.gsub("  ", "").strip.split("\n\n")

    movies.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie}"
      binding.pry
    end

  end

  def scrape_hrefs
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))
    urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
       anchor["href"]
    end
  end

  def self.scrape_details(index = "1")
   urls = UpcomingMovies::Scraper.new.scrape_hrefs
   doc = Nokogiri::HTML(open("#{urls[index.to_i - 1]}"))

   doc.css("ul.movie-details__detail").collect do |details|
     binding.pry
    #  new_movie = UpcomingMovies::New_movies.new
     title = details.search("h1.subnav__title").text.strip

     title = details.search("li.movie-details__release-date").text.strip
     binding.pry
   end
  end



end
