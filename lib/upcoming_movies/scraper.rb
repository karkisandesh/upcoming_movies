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

    # movies.each.with_index(1) do |movie, index|
    #   puts "#{index}. #{movie}"
    # end

  end

  def scrape_hrefs
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))
    urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
       anchor["href"]
    end
  end

  def find_by(input)
    scrape_details(input)
  end

  def scrape_details(index)
   urls = UpcomingMovies::Scraper.new.scrape_hrefs
   doc = Nokogiri::HTML(open("#{urls[index.to_i - 1]}"))

    new_movie = UpcomingMovies::New_movies.new

    new_movie.title = doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first.gsub(" (2019)", "")
    new_movie.release_date = details.search("ul.movie-details__detail li.movie-details__release-date").text.strip
    new_movie.synopsis = doc.search("p.mop__synopsis-content").text.strip
    new_movie.save
    end
end
