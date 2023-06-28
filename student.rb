require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', classroom = 'Not yet assigned', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self if classroom != 'Not yet assigned'
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
