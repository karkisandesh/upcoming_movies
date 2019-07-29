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
        select_movies
    elsif ["n", "no"].include?(input.downcase)
      goodbye
    else
      goodbye
    end
  end

  def list_movies
    @movies = UpcomingMovies::New_movies.all

    @movies.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie.title_name}"
      end
  end

  def select_movies
    puts ""
    puts "Please select a movie for details (1-8) or exit."
    input = gets.strip
    puts ""

    if input.to_i > 0 && input.to_i <= @movies.count
      movie_overview(input)
    elsif input != "exit"
        puts "Please select a movie for details (1-8) or exit."
        input = gets.strip
          if input != "exit"
            select_movies
          end
      else
        goodbye
    end
  end

  def movie_overview(input)
    UpcomingMovies::Scraper.new.scrape_details(input)
        UpcomingMovies::Movie_data.all.each do |movie_data|
          puts ""
          puts movie_data.title
          puts movie_data.release_date
          puts movie_data.synopsis

      end
  end

  def goodbye
    puts ""
    puts "Thank You."
  end
end
