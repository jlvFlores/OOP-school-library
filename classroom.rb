require './student'

class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label    
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

class1A = Classroom.new('Class 1-A')
midoriya = Student.new(16, "Midoriya")
bakugo = Student.new(16, "Bakugo", class1A)

puts midoriya.classroom
puts bakugo.classroom
# => Not yet assigned
# => #<Classroom:0x00007ff659002970>

puts class1A.students.map { |student| student.name}
# => Bakugo

class1A.add_student(midoriya)
puts midoriya.classroom
puts midoriya.classroom.label
# => #<Classroom:0x00007ff659002970>
# => Class 1-A

puts class1A.students.map { |student| student.name}
# => Bakugo
# => Midoriya