require './app'

class Options
  def initialize
    @app = App.new()
    list_options()
  end

  def list_options
    puts
    puts "Please choose an option by entering one of the numbers below"
    puts " 1 - List all books"
    puts " 2 - List all people"
    puts " 3 - Add a person"
    puts " 4 - Add a book"
    puts " 5 - Create a rental instance"
    puts " 6 - List all rentals of a given person by their ID"
    puts " 7 - Exit"
    input = gets.chomp
    if input.to_i > 0 && input.to_i < 7 
      @app.option(input.to_i)
      delay()
    elsif input.to_i == 7
      puts 'Goodbye'
    else
      puts 'Please choose a valid number'
      delay()
    end
  end

  def delay
    sleep(0.5)
    list_options()
  end
end

def main
  puts "Welcome to the School Library App!"
  Options.new()
end

main()