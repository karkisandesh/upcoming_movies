class UpcomingMovies::Scraper

  def scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))

    title = doc.css("li.footer-coming-soon--list-item a").text.gsub("  ", "").strip.split("\n\n")
  end

  def scrape_hrefs
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))
    urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
       anchor["href"]
    end
  end

    def scrape_details(index)
        urls = UpcomingMovies::Scraper.new.scrape_hrefs
        doc = Nokogiri::HTML(open("#{urls[index.to_i - 1]}"))

        UpcomingMovies::New_movies.details({
          title: doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first,
          release_date: doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip,
          synopsis: doc.search("p.mop__synopsis-content").text.strip
          })
      end
    end
