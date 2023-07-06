require './people/person'

class Teacher < Person
  attr_reader :id, :name, :age, :specialization

  def initialize(id, name, age, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    { id: @id, name: @name, age: @age, parent_permission: true, specialization: @specialization }
  end
end
