require './book'
require './rental'
require './student'
require './teacher'
require './books_manager'
require './rentals_manager'
require 'date'

class App
  def initialize()
    @books_manager = BooksManager.new([Book.new('The call of Cthulu', 'H.P. Lovecraft')])
    @people_manager = PeopleManager.new([Student.new(12, 'Ash')])
    @rentals_manager = RentalsManager.new([], @books_manager, @people_manager)
  end

  def use_method(user_input)
    case user_input
    when 1
      @books_manager.list_books
    when 2
      @people_manager.list_people
    when 3
      @people_manager.create_person
    when 4
      @books_manager.create_book
    when 5
      @rentals_manager.create_rental
    when 6
      puts 'Please enter the id of the person'
      print 'Id: '
      id = gets.chomp
      @rentals_manager.list_rentals_of(id.to_i)
    else
      puts "How'd you do that?"
    end
  end
end
