class UpcomingMovies::Scraper


  def scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))

    movies = doc.css("ul.inline-items.panel.footer-coming-soon--list a").text.gsub("  ", "").strip.split("\n\n")

    movies.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie}"
      binding.pry
    end

  end

  def self.scrape_details
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))
    urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
       anchor["href"]
    end
  end



end
