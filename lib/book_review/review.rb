
class BookReview::Review

    attr_accessor :url
    @@reviews = []
    def initialize(url)
      @url = url
      save
    end

  



end
