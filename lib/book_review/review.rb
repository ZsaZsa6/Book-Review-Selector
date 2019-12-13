class BookReview::Review
  attr_accessor :num_results, :url, :publication_dt, :book_title, :book_author, :summary, :isbn13
  @@all = []

  def initialize(attr_accessor)
    set_num_results
    attrs_from_hash(attr_accessor)
    save
  end

  def set_num_results
    @num_results = @@all.length + 1
  end

  def self.new_from_collection(reviews)
    reviews.each do |attr_accessor|
        new(attr_accessor)
    end
  end

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
    title_lists if @@all == []
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_id(input)
    all.find{|s| s.int_id == input.to_i}
  end
end
