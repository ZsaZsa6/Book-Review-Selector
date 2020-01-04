class BookReview::Api

  def self.isbn_lists(isbn13)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{isbn13}&api-key=#{ENV["API_KEY"]}")
        book = resp["results"][0]
        # binding.pry
        BookReview::Book.new_from_collection(book)
    end
  def self.title_lists(title)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{title}&api-key=#{ENV["API_KEY"]}")
      book = resp["results"][0]
      # binding.pry
      BookReview::Book.new_from_collection(book)

  end
end
