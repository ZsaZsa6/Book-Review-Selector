class BookReview::Review

    attr_accessor :book
    @@reviews = []

    def initialize(book)
      get_review(book)
      save

    end

    def get_review(book)

      doc = Nokogiri::HTML(open(book.url))
      article = doc.css("section")
      paragraphs = article.css("div p")
      binding.pry
      @@reviews = paragraphs.map do |p|
      puts p.text.encode("iso-8859-1").force_encoding("utf-8"), "\n----------------\n"

      end
      # reviews
    end
    def self.reviews
      get_review if @@reviews == []
      @@reviews
    end

    def save
      @@reviews << self
    end
end
