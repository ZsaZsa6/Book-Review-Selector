class BookReview::Review

    attr_accessor :url
    @@reviews = []

    def initialize(url)
      @url = url
      get_doc(url)

    end

    def get_doc(url)
      doc = Nokogiri::HTML(open(url))
      article = doc.css("section")
      paragraphs = article.css("div p")
      paragraphs.each do |p|
      puts p.text, "\n----------------\n"
      end
    end
end
