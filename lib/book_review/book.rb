class BookReview::Book

  attr_accessor :book_title, :book_author, :summary, :isbn13
  @@all = []

  def initialize(book_title, book_author, summary, isbn13)
      @book_title = book_title
      @book_author = book_author
      @summary = summary
      @isbn13 = isbn13
      save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    
  end

end
