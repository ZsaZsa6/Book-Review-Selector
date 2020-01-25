class BookReview::Api

  def self.lists(user_input, type)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?#{type}=#{user_input}&api-key=#{ENV["API_KEY"]}")
      if resp["results"].empty?
        BookReview::Session.new.invalid_input
      else
      book = resp["results"][0]
      book_title = book["book_title"]
      book_author = book["book_author"]
      summary = book["summary"]
      isbn13 = book["isbn13"][0]
      url = book["url"]
    BookReview::Book.new(book_title, book_author, summary, isbn13, url)
    end
  end
end
