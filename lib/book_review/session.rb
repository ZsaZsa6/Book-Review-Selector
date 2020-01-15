class BookReview::Session
  def greeting
    puts "Hello!! Welcome to Book Review Selector.\nWhich New York Times Best-selling Book review you like to read?"
    puts "You can select your book by one of the following methods:\nA. By title of book \nB. By the thirteen digit ISBN."
    puts "Please type A or B."
    puts "To exit, enter 'exit'"

    @input = gets.strip

    if @input == "A" || @input == "a"
      title_search
    end
    if @input == "B" || @input == "b"
      isbn_search
    end
    if @input == "exit" || @input == "Exit"
      goodbye
    # else
    #     invalid_input
    end
    confirmation
  end

  def title_search
    puts "Please enter the full title of the book:"
    @input = gets.strip
    title = @input
    BookReview::Api.title_lists(title)
  end

  def isbn_search
    puts "Please enter the thirteen digit ISBN:"
    @input = gets.strip
    isbn13 = @input
    BookReview::Api.isbn_lists(isbn13)
  end

  def confirmation
    # until BookReview::Book.all.length == 2
      book = BookReview::Book.all
      book_id = BookReview::Book.all.length + 1
      book.each do | book |
      puts "Book ID: #{book_id}\nBook Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}\n\n"
      puts "Which book would you like to select to read the NYT review?\n\n Please enter the Book ID of the book you would like to review or the number 0 if your book is not listed."
      @input = gets.strip
      if @input = 0
        greeting
      elsif do BookReview::Book.all.find{|book| book_id == @input.to_i}
      puts "Book ID: #{book_id}\nBook Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}"
      puts "Is this the book you would like to review?"
      @input = gets.strip
      elsif @input == "y" || @input == "yes" || @input == "Y" || @input == "Yes"
        puts "Getting Your Review"
        BookReview::Review.new(book.url)
        binding.pry

      else @input =="n" || @input == "N" || @input == "No" || @input == "NO"
      greeting
      end
        # book_id = BookReview::Book.all.length

        # BookReview::Book.all.each do
        # puts "Which book would you like to select to read the NYT review?"
        # @input = gets.strip
        #
        # BookReview::Book.all.find{|book| book_id == @input.to_i}
        # puts "Getting Your Review"
        # BookReview::Review.new(book.url)
        end
      end
    end
  end

  def invalid_input
    puts "That input is invalid. Please try again.\n\n"
    sleep(2)
    greeting
  end

  # def get_user_input
  #   @input = gets.strip
  # end

  def goodbye
    puts "Thank you for using Book Review Selector. Have a great day!"
  end
end
