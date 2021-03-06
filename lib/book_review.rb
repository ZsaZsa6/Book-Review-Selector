require 'pry'
require 'httparty'
require 'nokogiri'
require 'open-uri'
# require 'dotenv/load'

require_relative "book_review/version"
require_relative "book_review/review"
require_relative "book_review/book"
require_relative "book_review/api"
require_relative "book_review/session"


module BookReview
  class Error < StandardError; end
  

end
