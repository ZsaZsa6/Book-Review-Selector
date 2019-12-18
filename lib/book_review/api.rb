class BookReview::Api

  def self.review_lists
#   resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?isbn=#{isbn13}&api-key=#{ENV["API_KEY"]}")
#         reviews = resp["reviews"]
#         BookReview::Books.review(reviews)
end
  def self.title_lists
  resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?title=Becoming&api-key=#{ENV["API_KEY"]}")
      title = resp["reviews"]
  end

  def self.author_lists
#   resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?author=#{author}&api-key=#{ENV["API_KEY"]}")
#    author = resp["author"]
#     BookReview::Author.book_list

end

# def self.bs_lists
#   # resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=#{ENV["API_KEY"]}")
#   #   bs_lists = resp["names"]
#
#   end
end
