class BookReview::Book

  attr_accessor :url, :book_title, :book_author, :summary, :isbn13
  @@all = []

  def initialize(attr_accessor)
    # attrs_from_hash(attr_accessor)
    save
  end

  def self.new_from_collection(book)
    book.each do |attr_accessor|
      new(attr_accessor).values
    end
  end
  binding.pry

  # def attrs_from_hash(attr_accessor)
  #   book_hash = attr_accessor.values

        # binding.pry
  # end

  # def self.review_lists
  #   BookReview::Api.review_lists
  #   all
  # end

  def self.all
    BookReview.Api.title_lists if @@all == []
    @@all
  end

  def save
    @@all << self
  end

  # def self.find_by_id(input)
  #   all.find{|s| s.int_id == input.to_i}
  # end
end
