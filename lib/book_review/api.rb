class BookReview::Api

  def self.isbn_lists(isbn13)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{isbn13}&api-key=#{ENV["API_KEY"]}")
      if resp["result"].empty?
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

  def self.title_lists(title)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{title}&api-key=#{ENV["API_KEY"]}")

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
