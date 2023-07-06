require './books/book'

class BooksManager
  attr_reader :books

  def initialize(books)
    @books = books
  end

  def list_books
    @books.map { |book| puts "Title: '#{book.title}', Author: '#{book.author}'" }
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
    print "The book '#{new_book.title}' by '#{new_book.author}' was added successfully"
  end
end
