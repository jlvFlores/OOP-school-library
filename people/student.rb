require './people/person'

class Student < Person
  attr_reader :id, :name, :age
  attr_accessor :parent_permission, :classroom

  def initialize(id, name, age, parent_permission, classroom = 'Not yet assigned')
    super(id, name, age, parent_permission)
    @classroom = classroom
    classroom.students << self if classroom != 'Not yet assigned'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_hash
    { id: @id, name: @name, age: @age, parent_permission: @parent_permission, classroom: @classroom }
  end
end
