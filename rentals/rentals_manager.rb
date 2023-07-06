require './rentals/rental'
require 'date'

class RentalsManager
  attr_reader :rentals

  def initialize(rentals)
    @rentals = rentals
  end

  def list_rentals_of(id)
    puts 'Rentals:'
    rentals = @rentals.select { |rental| rental.person.id == id.to_i }
    if rentals.any?
      rentals.map { |rental| puts "Date: #{rental.date}, Book: '#{rental.book.title}' by '#{rental.book.author}'" }
    else
      puts 'No rentals found for the specified person ID.'
    end
  end

  def create_rental(book, person)
    current_date = Date.today
    @rentals.push(Rental.new(current_date, book, person))
    puts 'The rental instance was created successfully'
  end
end
