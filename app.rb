require './books/books_manager'
require './people/people_manager'
require './rentals/rentals_manager'
require './data_manager'

class App
  def initialize()
    @data_manager = DataManager.new
    @books_manager = BooksManager.new([])
    @people_manager = PeopleManager.new([])
    @rentals_manager = RentalsManager.new([])
  end

  def list_books
    @books_manager.list_books
  end

  def list_people
    @people_manager.list_people
  end

  def create_person
    puts 'Are you adding a student (1) or a teacher (2)?'
    print '[Input a number]: '
    person_instance = gets.chomp.to_i
    case person_instance
    when 1, 2
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      person_instance == 1 ? create_student(age, name) : create_teacher(age, name)
    else
      puts 'Invalid number'
    end
  end

  def create_book
    puts "Please enter the book's"
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books_manager.create_book(title, author)
  end

  def create_rental
    if @books_manager.books.empty?
      puts 'There are no books in the library'
      return
    end

    if @people_manager.people.empty?
      puts 'There are no people in the library'
      return
    end

    book = select_book
    person = select_person

    @rentals_manager.create_rental(book, person)
  end

  def list_rentals_of
    puts 'Please enter the id of the person'
    print 'Id: '
    id = gets.chomp
    @rentals_manager.list_rentals_of(id)
  end

  private

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    resp = gets.chomp.capitalize
    @people_manager.create_student(age, name, resp)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    @people_manager.create_teacher(age, name, specialization)
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books_manager.books.each_with_index do |book, index|
      puts " #{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_number = gets.chomp.to_i
    @books_manager.books[book_number]
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people_manager.people.each_with_index do |person, index|
      tag = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts " #{index}) [#{tag}] ID: #{person.id} Name: #{person.name}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    @people_manager.people[person_number]
  end
end
