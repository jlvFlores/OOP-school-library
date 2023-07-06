require './people/student'
require './people/teacher'

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

  def create_student(id, name, age, resp)
    permission = resp == 'Y'
    puts "Permission has been set to #{permission}"
    student = Student.new(id, name, age, permission)
    @people.push(student)
    puts 'The student was added successfully'
  end

  def create_teacher(id, name, age, specialization)
    @people.push(Teacher.new(id, name, age, specialization))
    puts 'The teacher was added successfully'
  end
end
