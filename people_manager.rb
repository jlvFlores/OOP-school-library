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

  def create_student(age, name, resp)
    permission = resp == 'Y'
    puts "Permission has been set to #{permission}"
    student = Student.new(age, name)
    student.parent_permission = permission
    @people.push(student)
    puts 'The student was added successfully'
  end

  def create_teacher(age, name, specialization)
    @people.push(Teacher.new(specialization, age, name))
    puts 'The teacher was added successfully'
  end
end
