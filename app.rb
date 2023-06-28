require './book'
require './rental'
require './student'
require './teacher'
require 'date'

class App
  def initialize()
    @books = [Book.new('Hatchet', 'Paul')]
    @people = [Student.new(12, 'Ash', 'Not yet assigned', true)]
    @rentals = []
  end

  def option(user_input)
    case user_input
    when 1
      list_books()
    when 2
      list_people()
    when 3
      create_person()
    when 4
      create_book()
    when 5
      create_rental()
    when 6
      puts 'Please enter the id of the person'
      print 'Id: '
      id = gets.chomp
      list_rentals_of(id.to_i)
    else
      puts "How'd you do that?"
    end
  end

  def list_books
    @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.map do |person| 
      tag = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{tag}] ID: #{person.id} Name: #{person.name}, Age: #{person.age}"
    end 
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
      if person_instance == 1
        print 'Has parent permission? [Y/N]: '
        resp = gets.chomp.capitalize
        resp == 'Y' ? permission = true : permission = false
        puts "Permission has been set to #{permission}"
        @people.push(Student.new(age, name, 'Not yet assigned', permission))
        puts 'The student was added successfully'
      else
        print 'Specialization: '
        specialization = gets.chomp.capitalize
        @people.push(Teacher.new(specialization, age, name))
        puts 'The teacher was added successfully'
      end
    else
      puts "Invalid number"
    end
  end

  def create_book
    puts "Please enter the book's"
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    print "The book '#{new_book.title}' by '#{new_book.author}' was added successfully"
  end

  def create_rental
    if @books.any?
      if @people.any? 
        puts 'Select a book from the following list by number'
        @books.each_with_index { |book, index| puts " #{index}) Title: #{book.title}, Author: #{book.author}" }
        book_number = gets.chomp
        book = @books[book_number.to_i]

        puts 'Select a person from the following list by number (not id)'
        @people.each_with_index do |person, index| 
          tag = person.is_a?(Student) ? 'Student' : 'Teacher'
          puts " #{index}) [#{tag}] ID: #{person.id} Name: #{person.name}, Age: #{person.age}"
        end
        person_number = gets.chomp
        person = @people[person_number.to_i]

        current_date = Date.today
        @rentals.push(Rental.new(current_date, book, person))
        puts current_date
        puts 'The rental instace was created successfully'
      else 
        puts 'There are no people in the library'
      end
    else
      puts 'There are no books in the library'
    end
  end

  def list_rentals_of(id)
    puts 'Rentals:'
    rentals = @rentals.select { |rental| rental.person.id == id }
    if rentals.any?
      rentals.map { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' by '#{rental.book.author}'" }
    else
      puts 'No rentals found for the specified person ID.'
    end
  end
end
