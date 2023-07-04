require './people/person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', classroom = 'Not yet assigned')
    super(age, name)
    @classroom = classroom
    classroom.students << self if classroom != 'Not yet assigned'
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
