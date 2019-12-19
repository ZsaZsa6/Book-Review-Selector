class BookReview::Api

  def self.isbn_lists
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{isbn13}&api-key=#{ENV["API_KEY"]}")
        reviews = resp["reviews"]
        BookReview::Book.review(reviews)
        # binding.pry
    end
  def self.title_lists(title)
      resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=#{"title"}&api-key=#{ENV["API_KEY"]}")

      resp = resp["results"][0]["book_title"]["book_author"]["summary"]["isbn13"][0]
      book = BookReview::Book.new
      binding.pry
      BookReview::Book.title("titles")
  end

#   def self.author_lists
# #   resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?author=#{author}&api-key=#{ENV["API_KEY"]}")
# #    author = resp["author"]
# #     BookReview::Author.book_list

# end

# def self.bs_lists
#   # resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=#{ENV["API_KEY"]}")
#   #   bs_lists = resp["names"]
#
#   end
end
