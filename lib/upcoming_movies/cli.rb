class UpcomingMovies::CLI

  def call
    puts "----------------------------******-----------------------------"
    puts "Welcome to the Upcoming Movies event!"
    puts ""
    puts "Please follow the instruction to view the movies you would like."
    puts ""
    puts "Type list to list the movies or exit"

    input = gets.strip
      if input == "list".upcase
        list
      else
        goodbye
      end
  end

  def list
      puts ""
      puts "hello"
  end

  def goodbye
    puts "Thank you."
  end


end
