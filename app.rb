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
    @people = [Student.new(12, 'Ash')]
    @rentals_manager = RentalsManager.new([], @books_manager, @people)
  end

  def use_method(user_input)
    case user_input
    when 1
      @books_manager.list_books
    when 2
      list_people
    when 3
      create_person
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
      person_instance == 1 ? create_student(age, name) : create_teacher(age, name)
    else
      puts 'Invalid number'
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    resp = gets.chomp.capitalize
    permission = resp == 'Y'
    puts "Permission has been set to #{permission}"
    student = Student.new(age, name)
    student.parent_permission = permission
    @people.push(student)
    puts 'The student was added successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    @people.push(Teacher.new(specialization, age, name))
    puts 'The teacher was added successfully'
  end
end
