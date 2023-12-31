class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_hash
    { title: @title, author: @author, rentals: @rentals }
  end
end
