class BookReview::Review

    attr_accessor :url
    @@reviews = []

    def initialize(url)
      @url = url
      get_doc(url)
      save

    end

    def get_doc(url)
      doc = Nokogiri::HTML(open(url))
      article = doc.css("section")
      paragraphs = article.css("div p")
      reviews = paragraphs.each do |p|
        # binding.pry
        p.text.encode("iso-8859-1").force_encoding("utf-8"), "\n----------------\n"
      end
      reviews
    end
    def save
      @@reviews << self
    end
end
