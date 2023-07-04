class PeopleManager
  attr_reader :people

  def initialize(people)
    @people = people
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