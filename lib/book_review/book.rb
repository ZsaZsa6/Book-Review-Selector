class BookReview::Book

  attr_accessor :book_title, :book_author, :summary, :isbn13, :url
  @@all = []

  def initialize(book_title, book_author, summary, isbn13, url)
      @book_title = book_title
      @book_author = book_author
      @summary = summary
      @isbn13 = isbn13
      @url = url
      @book_id = @@all.length + 1
      # set_book_id
      save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  # def set_book_id
  # @book_id = @@all.length + 1
  # end

  def self.find_by_id(input)
   all.find{|book| book.book_id == input.to_i}
 end

end
