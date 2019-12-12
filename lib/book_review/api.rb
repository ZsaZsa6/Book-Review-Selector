class BookReview::Api

  def self.get_reviews
#         resp = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=Spas&location=London&limit=10", {
#             {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"},
#         })
#         # binding.pry - this is a great place to debug. See what `resp` is - is it the data you want?
#         #                                               Is it a message saying you forgot some authorization?
#         spas = resp["businesses"]
#         LondonSpas::Spa.new_from_collection(spas)
#     end
# end
