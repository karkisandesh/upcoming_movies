class UpcomingMovies::Scraper


  def self.scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))

    movies = doc.css("ul.inline-items.panel.footer-coming-soon--list a").text.gsub("  ", "").strip.split("\n\n")

    movies.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie}"
      binding.pry
    end

  end

end
