class BookReview::Api

#   def self.get_spas
#         resp = HTTParty.get("https://api.yelp.com/v3/businesses/search?term=Spas&location=London&limit=10", {
#             # Some parameters are passed in via query string (eg term & location above - ?term=Spas&location=London)
#             # And some in headers (eg authorization below)
#             # This can depend on the API itself - check the documentation if you're not sure where to start.
#             headers: {"Authorization" => "Bearer #{ENV['YELP_API_KEY']}"},
#         })
#         # binding.pry - this is a great place to debug. See what `resp` is - is it the data you want?
#         #                                               Is it a message saying you forgot some authorization?
#         spas = resp["businesses"]
#         LondonSpas::Spa.new_from_collection(spas)
#     end
# end
