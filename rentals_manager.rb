class RentalsManager
  def initialize(rentals, books_manager, people)
    @rentals = rentals
    @books = books_manager.books
    @people = people
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

  def create_rental
    if @books.empty?
      puts 'There are no books in the library'
      return
    end

    if @people.empty?
      puts 'There are no people in the library'
      return
    end

    book = select_book
    person = select_person

    current_date = Date.today
    @rentals.push(Rental.new(current_date, book, person))
    puts current_date
    puts 'The rental instance was created successfully'
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts " #{index}) Title: #{book.title}, Author: #{book.author}" }
    book_number = gets.chomp.to_i
    @books[book_number]
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      tag = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts " #{index}) [#{tag}] ID: #{person.id} Name: #{person.name}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    @people[person_number]
  end
end
