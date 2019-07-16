class UpcomingMovies::CLI

  def call
    puts "----------------------------******-----------------------------"
    puts "Welcome to the Upcoming Movies event!"
    puts ""
    puts "Would you like to view the upcoming movies? y/n"
    input = gets.strip.downcase

    if ["y", "yes"].include?(input)
        list_movies
        select_movies
    else
      goodbye
    end
  end

  def list_movies
    @get_movies = UpcomingMovies::Scraper.new.scrape_movies
    puts ""
      @get_movies.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie}"
      end
  end

  def select_movies
    puts ""
    puts "Please select a movie for details (1-8) or exit."
    input = gets.strip
    puts ""

    if input.to_i > 0 && input.to_i <= @get_movies.size
        UpcomingMovies::New_movies.movie_overview(input)
    else
        puts "Please select a movie for details (1-8) or exit."
        input = gets.strip
        goodbye if input == "exit"
    end
  end

  def goodbye
    puts ""
    puts "Thank You."
  end

end
