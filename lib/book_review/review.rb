

class BookReview::Review

    attr_accessor :url
    @@reviews = []
    def initialize(url)
      @url = url
      save
    end


    def save
    @@reviews << self
    end


end
