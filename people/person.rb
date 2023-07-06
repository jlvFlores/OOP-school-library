require './decorators/nameable'
require './decorators/capitalize_decorator'
require './decorators/trimmer_decorator'

class Person < Nameable
  def initialize(id, name, age, parent_permission)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
