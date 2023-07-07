require './setup/app'

class Options
  def initialize()
    @app = App.new
    list_options
  end

  def list_options
    puts
    puts 'Please choose an option by entering one of the numbers below'
    puts ' 1 - List all books'
    puts ' 2 - List all people'
    puts ' 3 - Add a person'
    puts ' 4 - Add a book'
    puts ' 5 - Create a rental instance'
    puts ' 6 - List all rentals of a given person by their ID'
    puts ' 7 - Exit'
    input = gets.chomp
    if input.to_i.positive? && input.to_i < 7
      use_method(input.to_i)
      delay
    elsif input.to_i == 7
      @app.save_data
    else
      puts 'Please choose a valid number'
      delay
    end
  end

  def use_method(user_input)
    case user_input
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_of
    else
      puts "How'd you do that?"
    end
  end

  private

  # UX sugar
  def delay
    sleep(0.5)
    list_options
  end
end
