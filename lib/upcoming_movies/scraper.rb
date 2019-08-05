class UpcomingMovies::Scraper

  def scrape_movies
    doc = Nokogiri::HTML(open("https://www.fandango.com/"))


    movies = doc.css("a.footer-coming-soon--heading")
    # .text.gsub("  ", "").strip.split("\n\n")
    movies.each do |movie|
      title = movie.text
      href = movie.attr("href")
      @movie_data = UpcomingMovies::New_movies.new(title, href)
    end
  end

  # def scrape_hrefs
  #   doc = Nokogiri::HTML(open("https://www.fandango.com/"))
  #   urls = doc.css(".footer-coming-soon--info-block.poster-thumb-size-s a.heading-style-1.footer-coming-soon--heading").collect do |anchor|
  #      anchor["href"]
  #   end
  # end
# def scrape_details(movie)
  # Nokogiri open movie.href
  # build a hash for synopsis and release_date
  # call movie.details(details_hash)
    def scrape_details(index)

      data = UpcomingMovies::New_movies.find(index)
      doc = Nokogiri::HTML(open(data.href))


          @movie_data.details({
            title: doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first,
            release_date: doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip,
            synopsis: doc.search("p.mop__synopsis-content").text.strip})

            UpcomingMovies::New_movies.new.details({
              title: doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first,
              release_date: doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip,
              synopsis: doc.search("p.mop__synopsis-content").text.strip})
            binding.pry



      #     title = doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first
      #     release_date = doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip
      #     synopsis = doc.search("p.mop__synopsis-content").text.strip
      #     UpcomingMovies::New_movies.details(title, release_date, synopsis)
      # end


    #     title = doc.search("h1.subnav__title.heading-style-1.heading-size-xl").text.strip.split("\n").first
    #     release_date = doc.search("ul.movie-details__detail li.movie-details__release-date").text.strip
    #     synopsis = doc.search("p.mop__synopsis-content").text.strip
    #     UpcomingMovies::Movie_data.new(title, release_date, synopsis)
    # end


    end
end
