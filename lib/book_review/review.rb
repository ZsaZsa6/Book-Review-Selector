class BookReview::Review

    attr_accessor :book

    def initialize(book)
      set_review(book)
    end

    def set_review(book)

      doc = Nokogiri::HTML(open(book.url))
      article = doc.css("section")
      paragraphs = article.css("div p")

      paragraphs.map do |p|
        puts p.text.encode("iso-8859-1").force_encoding("utf-8"), "\n----------------\n"

      end
      book.review = paragraphs
    end
  end
