class BookReview::Session
  def greeting
    puts "Hello!! Welcome to Book Review Selector.\nWhich New York Times Best-selling Book review you like to read?"
    puts "You can select your book by one of the following methods:\nA. By title of book \nB. By the thirteen digit ISBN."
    puts "Please type A or B."
    puts "To exit, enter 'exit'"

    @input = gets.strip

    if @input == "A" || @input == "a"
      book = title_search
    end
    if @input == "B" || @input == "b"
      book = isbn_search
    end
    if @input == "exit" || @input == "Exit"
      goodbye

      ### WORK ON THIS ###
    # else
    #     invalid_input
    end
    confirmation(book)
  end

  def title_search
    puts "Please enter the full title of the book:"
    @input = gets.strip
    title = @input
      if found_book = BookReview::Book.all.find {|book| book.book_title.downcase == title.downcase}
        return found_book
      else
    book = BookReview::Api.title_lists(title)
    end
  end

  def isbn_search
    puts "Please enter the thirteen digit ISBN:"
    @input = gets.strip
    isbn13 = @input
      if found_book = BookReview::Book.all.find {|book| book.isbn13 == isbn13}
        return found_book
      else
    book = BookReview::Api.isbn_lists(isbn13)
      end
  end

  def confirmation(book)

      puts "Book Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}\n\n"
      puts "Is this the book you would like to review?"
      @input = gets.strip
      if @input == "y" || @input == "yes" || @input == "Y" || @input == "Yes"
        puts "Getting Your Review"
        BookReview::Review.new(book.url)

      elsif @input =="n" || @input == "N" || @input == "No" || @input == "NO"
      greeting

      else
        invalid_input
      end
    end

  def invalid_input
    puts "That input is invalid. Please try again.\n\n"
    sleep(2)
    greeting
  end
   ##### Put this in place of the @input = gets.strip everywhere ####
  # def get_user_input
  #   @input = gets.strip
  # end

  def goodbye
    puts "Thank you for using Book Review Selector. Have a great day!"
  end
end
