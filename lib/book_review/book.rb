class BookReview::Book

  attr_accessor :book_title, :book_author, :summary, :isbn13
  @@all = {}

  def initialize(attr_accessor)
    # attrs_from_hash(attr_accessor)
    # binding.pry
    save
  end

  def self.new_from_collection(book)
    book.each do |attr_accessor|
      @@all < new(attr_accessor)
    end
  end

  # def attrs_from_hash(attr_accessor)
  #     @@all << attr_accessor
  #     # binding.pry
  # end

  # def self.title_lists
  #   BookReview::
  #   # binding.pry
  #   all
  # end

  def self.all
    BookReview.Api.title_lists if @@all == []
    @@all
  end

  def save
    @@all << self
  end

end
