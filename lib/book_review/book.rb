class BookReview::Book

  attr_accessor :book_title, :book_author, :summary, :isbn13, :url
  @@all = []

  def initialize(book_title, book_author, summary, isbn13, url)
      @book_title = book_title
      @book_author = book_author
      @summary = summary
      @isbn13 = isbn13
      @url = url

      save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # def set_book_id
  # book_id = @@all.length + 1
  # end




end
