class BookReview::Api

  def self.review_lists
#         {
#             {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"},
#         })
#         # binding.pry - this is a great place to debug. See what `resp` is - is it the data you want?
#         #                                               Is it a message saying you forgot some authorization?
#         spas = resp["businesses"]
#         LondonSpas::Spa.new_from_collection(spas)
# end
def self.title_lists

#

end

def self.author_lists
# resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/reviews.json?author=#{author}&api-key=#{ENV['API_KEY']}")
end

def self.bs_lists
  resp = HTTParty.get("https://api.nytimes.com/svc/books/v3/lists/names.json")

end
