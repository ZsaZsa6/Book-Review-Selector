require 'nokogiri'
require 'open-uri'

class BookReview::Review

    attr_accessor :url
    @@reviews = []

    def initialize(url)
      @url = url
      get_docs(url)
    end

    def get_docs(url)
      html = open(url)
      doc = Nokogiri::HTML(html)
      binding.pry
    end

    def self.review(doc)
      review = doc.css("#story > section > div:nth-child(1) > div > p:nth-child(2)")
      binding.pry
      review.each do |review|
        puts review.text.strip
      end


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
end
