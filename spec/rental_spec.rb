require './rentals/rental'
require './books/book'
require './people/teacher'

describe Rental do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Teacher.new(1, 'Name', 18, 'specialty')
  end
  context 'when initializing with valid parameters' do
    before :each do
      @rental = Rental.new('2000-01-01', @book, @person)
    end

    it 'returns a valid Book object when given three arguments' do
      expect(@rental).to be_instance_of(Rental)
    end

    it "person's rentals are being updated" do
      expect(@person.rentals).to eq([@rental])
    end

    it "book's rentals are being updated" do
      expect(@book.rentals).to eq([@rental])
    end

    it 'returns the correct hash structure when calling to_hash method' do
      expected_book_hash = { title: @book.title, author: @book.author, rentals: @book.rentals }
      expected_person_hash = { id: @person.id, name: @person.name, age: @person.age, parent_permission: true,
                               specialization: @person.specialization }
      expected_hash = { date: @rental.date, book: expected_book_hash, person: expected_person_hash }

      expect(@rental.to_hash).to eq(expected_hash)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given three arguments' do
      expect { Rental.new('2000-01-01', @book) }.to raise_exception(ArgumentError)
    end

    it 'raises an NameError when not given the correct type of arguments' do
      expect { Rental.new('2000-01-01', 'book', 'person') }.to raise_exception(NameError)
    end
  end
end
