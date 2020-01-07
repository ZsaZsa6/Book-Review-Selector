require 'nokogiri'
require 'open-uri'

class BookReview::Review

    attr_accessor :url
    @@reviews = []
    def initialize(url)
      @url = url
      html = open(url)
      doc = Nokogiri::HTML(html)

      binding.pry
    end


    # def save
    # @@reviews << self
    # end


end
