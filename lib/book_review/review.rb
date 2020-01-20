class BookReview::Review

    attr_accessor :book

    def initialize(book)
      @review_text = set_review(book)
    end

    def set_review(book)
      book.review = self

      doc = Nokogiri::HTML(open(book.url))
      article = doc.css("section")
      article.css("div p")

    end
    def get_review_text
      @review_text.each do |p|
        puts p.text.encode("iso-8859-1").force_encoding("utf-8"), "\n----------------\n"
      end
    end
  end
