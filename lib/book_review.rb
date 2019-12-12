require 'pry'
require 'httparty'
require 'dotenv/load'

require_relative "book_review/version"
require_relative "book_review/review"
require_relative "book_review/api"


module BookReview
  class Error < StandardError; end
  # Your code goes here...
end
