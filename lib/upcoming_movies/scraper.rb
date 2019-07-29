class UpcomingMovies::Scraper

  def scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))


    movies = doc.css("a.footer-coming-soon--heading")
    # .text.gsub("  ", "").strip.split("\n\n")
    movies.each do |movie|
      title = movie.text
      href = movie.attr("href")
      UpcomingMovies::New_movies.new(title, href)
    end
  end

  # def scrape_hrefs
  #   doc = Nokogiri::HTML(open("https://www.fandango.com/"))
  #   urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
  #      anchor["href"]
  #   end
  # end

    def scrape_details(index)
        hrefs = UpcomingMovies::New_movies.all.collect {|movie| movie.href}
        doc = Nokogiri::HTML(open(hrefs[index.to_i - 1]))


      #     title = doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first
      #     release_date = doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip
      #     synopsis = doc.search("p.mop__synopsis-content").text.strip
      #     UpcomingMovies::New_movies.details(title, release_date, synopsis)
      # end


        title = doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first
        release_date = doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip
        synopsis = doc.search("p.mop__synopsis-content").text.strip
        UpcomingMovies::Movie_data.new(title, release_date, synopsis)
    end


        # UpcomingMovies::Movie_data.details({
        #   title: doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first,
        #   release_date: doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip,
        #   synopsis: doc.search("p.mop__synopsis-content").text.strip})

  end
