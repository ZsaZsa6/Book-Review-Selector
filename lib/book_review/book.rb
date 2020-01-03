class BookReview::Book

  attr_accessor :url, :book_title, :book_author, :summary, :isbn13
  @@all = []

  def initialize(attr_accessor)
    attrs_from_hash(attr_accessor)
    binding.pry
    save
  end

  def self.new_from_collection(book)
    book.each do |attr_accessor|
      new(attr_accessor)
      # binding.pry
    end
  end

  def attrs_from_hash(attr_accessor)
    attr_accessor.each do |k, v|
      send("#{k}=", v)
    end
  end

  def self.title_lists
    BookReview::Api.title_lists
    binding.pry
    all
  end

  def self.all
    BookReview.Api.title_lists if @@all == []
    @@all
  end

  def save
    @@all << self
  end

end
