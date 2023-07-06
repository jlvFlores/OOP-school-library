require './books/books_manager'
require './people/people_manager'
require './rentals/rentals_manager'
require './constants'
require 'json'

class App
  include Constants

  def initialize()
    @books_manager = load_books
    @people_manager = load_people
    @rentals_manager = load_rentals
  end

  def save_data
    save_books
    save_people
    save_rentals
    puts 'Data has been saved.'
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
      id = Random.rand(1..1000)
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      person_instance == 1 ? create_student(id, name, age) : create_teacher(id, name, age)
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

  def create_student(id, name, age)
    print 'Has parent permission? [Y/N]: '
    resp = gets.chomp.capitalize
    @people_manager.create_student(id, name, age, resp)
  end

  def create_teacher(id, name, age)
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    @people_manager.create_teacher(id, name, age, specialization)
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

  def save_books
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[0])
    books_array = @books_manager.books.map(&:to_hash)

    json_data = JSON.generate(books_array)

    File.write(file_location, json_data)
  end

  def save_people
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[1])
    people_array = @people_manager.people.map(&:to_hash)

    json_data = JSON.generate(people_array)

    File.write(file_location, json_data)
  end

  def save_rentals
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[2])
    rentals_array = @rentals_manager.rentals.map(&:to_hash)

    json_data = JSON.generate(rentals_array)

    File.write(file_location, json_data)
  end

  def load_books
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[0])
    return BooksManager.new([]) if File.empty?(file_location)

    json_data = File.read(file_location)
    books_data = JSON.parse(json_data)

    books_array = books_data.map { |book| Book.new(book['title'], book['author']) }

    BooksManager.new(books_array)
  end

  def load_people
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[1])
    return PeopleManager.new([]) if File.empty?(file_location)

    json_data = File.read(file_location)
    people_data = JSON.parse(json_data)

    people_array = people_data.map do |person|
      if person.key?('classroom')
        Student.new(person['id'], person['name'], person['age'], person['parent_permission'], person['classroom'])
      else
        Teacher.new(person['id'], person['name'], person['age'], person['specialization'])
      end
    end

    PeopleManager.new(people_array)
  end

  def load_rentals
    file_location = File.join(DIRECTORY_PATH, FILE_NAMES[2])
    return RentalsManager.new([]) if File.empty?(file_location)

    json_data = File.read(file_location)
    rentals_data = JSON.parse(json_data)

    rentals_array = rentals_data.map do |rental|
      rental_book = Book.new(rental['book']['title'], rental['book']['author'])
      if rental['person'].key?('classroom')
        rental_person = Student.new(rental['person']['id'], rental['person']['name'], rental['person']['age'],
                                    rental['person']['parent_permission'], rental['person']['classroom'])
      else
        rental_person = Teacher.new(rental['person']['id'], rental['person']['name'], rental['person']['age'],
                                    rental['person']['specialization'])
      end
      Rental.new(rental['date'], rental_book, rental_person)
    end

    RentalsManager.new(rentals_array)
  end
end
