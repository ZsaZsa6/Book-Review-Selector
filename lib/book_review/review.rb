

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
      puts p.text, "--"
      # # if p.text != "\u009" && p.text != ""
      # # puts review.count
      # #   puts article.css("div").text
      #   binding.pry

      end

    end

    def get_reviews

    end
    # def review(doc)
    #   review =
    #   binding.pry
    #   review.each do |review|
    #     puts review.text.strip
    #   end


      # #(Element:0x1411f6c {
      #                                                name = "p",
      #                                                attributes = [
      #                                                  #(Attr:0x14106f8 {
      #                                                    name = "class",
      #                                                    value = "css-exrw3m evys1bk0"
      #                                                    })],
      #                                                children = [
    # /html/body/div[1]/div/div/div[2]/main/div/article/section/div[1]/div/p[4]


end
