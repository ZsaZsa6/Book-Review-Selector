class BookReview::Book

  attr_accessor :book_title, :book_author, :summary, :isbn13, :url, :review
  @@all = []

  def initialize(book_title, book_author, summary, isbn13, url)
      @book_title = book_title
      @book_author = book_author
      @summary = summary
      @isbn13 = isbn13
      @url = url
      @review = nil
      save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end
