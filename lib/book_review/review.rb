class BookReview::Book

  attr_accessor :url, :book_title, :book_author, :summary, :isbn13
  @@all = []

  def initialize(attr_accessor)
    attrs_from_hash(attr_accessor)
    title(book)
    save
  end

  def set_num_results
    @num_results = @@all.length + 1
  end

  def self.title(book)
    book.each do |attr_accessor|
      new(attr_accessor)
    end
  end

  # def self.review(reviews)
  #   reviews.each do |attr_accessor|
  #       new(attr_accessor)
  #   end
  # end

  def attrs_from_hash(attr_accessor)
    attr_accessor.each do |k, v|
        send("#{k}=", v)
    end
  end

  def self.review_lists
    BookReview::Api.review_lists
    all
  end

  def self.all
    BookReview.Api.title_lists if @@all == []
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_id(input)
    all.find{|s| s.int_id == input.to_i}
  end
end
