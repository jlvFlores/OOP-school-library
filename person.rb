require './nameable'
require './decorators/capitalize_decorator'
require './decorators/trimmer_decorator'

require './book'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

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

mr_teacher = Person.new(42, 'Mr. Teacher')
hatchet_book = Book.new('Hatchet', 'Gary Paulsen')
got_book = Book.new('Game of Thrones', 'Bearded fat guy')
rental1 = Rental.new('today', hatchet_book, mr_teacher)
rental2 = Rental.new('today', got_book, mr_teacher)
rental3 = Rental.new('yesterday', got_book, mr_teacher)

puts got_book.rentals
# => #<Rental:0x00007f0b10fe26b8>
# => #<Rental:0x00007f0b10fe2640>

puts rental1.book.title
puts rental2.book.title
# => Hatchet
# => Game of Thrones

puts mr_teacher.rentals
# => <Rental:0x00007f0b10fe27a8>
# => <Rental:0x00007f0b10fe26b8>
# => <Rental:0x00007f0b10fe2640>

puts rental2.person.name
puts rental3.person.name
# => Mr. Teacher
# => Mr. Teacher
