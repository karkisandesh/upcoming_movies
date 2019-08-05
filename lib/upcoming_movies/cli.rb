class UpcomingMovies::CLI

  def call
    UpcomingMovies::Scraper.new.scrape_movies

    puts "----------------------------******-----------------------------"
    puts "Welcome to the Upcoming Movies event!"
    puts ""
    puts "Would you like to view the upcoming movies? y/n or exit"
    input = gets.strip
    if ["y", "yes"].include?(input.downcase)
          list_movies
      elsif  ["n", "no", "exit"].include?(input.downcase)
        #  ["n", "no"].include?(input.downcase)
        goodbye
      else
        call
    end
end

  def list_movies
    @movies = UpcomingMovies::New_movies.all
    @movies.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie.title_name}"
    end
    select_movies
  end

  def select_movies
    puts ""
    puts "Please select a movie for details (1-8) or exit."
    input = gets.strip
    puts ""
      if input.to_i > 0 && input.to_i <= @movies.count
            movie_overview(input)
            puts ""
            puts "Please select list to list movies or exit."
               input_list = gets.strip
                if input_list == "list"
                  list_movies
                  puts ""
                else
                  goodbye

                end
            else
            goodbye
    end
  end

  def movie_overview(input)
    # the user has selected one movie
    # find that movie object in your New_movies

    selected_movie = UpcomingMovies::New_movies.find(input)

  #  if selected_movie details don't exist yet
    # call the scraper method scrape_details and pass the movie object
    # Scraper.scrape_deatils(selected_movie)
      # insice that method, collect the details, then call the INSTANCE method #details on the movie
      # select_movies.details(details_hash)
    # if the details for that movie object already have been scraped, show them
    # otherwise, scrape them, then show them
    # Only one movie class sholud exist
    # Each movie will start out iwth a title and an href... then only  populate details
    # for a movie when the user chooses it.
    UpcomingMovies::Scraper.new.scrape_details(selected_movie)

    # UpcomingMovies::New_movies.all.each do |selected_movie|

      puts ""
      puts selected_movie.title
      puts selected_movie.release_date
      puts selected_movie.synopsis

    # end

  #       # UpcomingMovies::New_movies.all.each do |movie_data|
  #
  #         puts ""
    #         puts selected_movie.title
  #         puts selected_movie.release_date
  #         puts selected_movie.synopsis
  end

  def goodbye
    puts ""
    puts "Thank You"
  end

end
