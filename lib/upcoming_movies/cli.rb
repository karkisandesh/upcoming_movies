class UpcomingMovies::CLI

  def call
    puts "----------------------------******-----------------------------"
    puts "Welcome to the Upcoming Movies event!"
    puts ""
    puts "Would you like to view the upcoming movies? y/n"
    input = gets.strip.downcase

    if input == 'y'
        list_movies
        select_movies
    else
      goodbye
    end
  end

  def get_movies
    @movies = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
  end

  def list_movies
      get_movies.each.with_index(1) do |index, movie|
        puts "#{index}. #{movie}"
      end
  end

  def select_movies
    puts ""
    puts "Please select a movie for details (1-8)."
    input = gets.strip
    if input.to_i > 0 && input.to_i <= 8
        list_movie_details
      else
        puts "Please select a movie for details (1-8) or exit."
        input = gets.strip
        goodbye if input == "exit"
      end
  end

  def list_movie_details
    puts ""
    UpcomingMovies::New_movies.new
  end

  def goodbye
    puts ""
    puts "Thank You."
  end

end
