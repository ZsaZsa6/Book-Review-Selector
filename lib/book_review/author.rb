
class BookReview::Author

    attr_accessor :num_results, :book_title, :book_author, :summary, :url, :isbn13
    @@books = []
    def initialize(attr_accessor)

    end

    def set_num_results
      @num_results = @@books.length + 1
    end

    def self.book_list(books)
      books.each do |attr_accessor|
          new(attr_accessor)
      end
    end



end
