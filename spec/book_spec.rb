require './books/book'

describe Book do
  context 'when initializing with valid parameters' do
    before :each do
      @book = Book.new('Title', 'Author')
    end

    it 'returns a valid Book object when given two arguments' do
      expect(@book).to be_instance_of(Book)
    end

    it 'returns the correct hash structure when calling to_hash method' do
      expected_hash = { title: @book.title, author: @book.author, rentals: [] }
      expect(@book.to_hash).to eq(expected_hash)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given two arguments' do
      expect { Book.new('Title') }.to raise_exception(ArgumentError)
    end
  end
end
