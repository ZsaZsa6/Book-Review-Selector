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
    found_book = title
    if found_book = BookReview::Book.all.detect {|book| book.book_title == title}
       found_book(book)

    else
    BookReview::Api.title_lists(title)
    end
  end

  def isbn_search
    puts "Please enter the thirteen digit ISBN:"
    @input = gets.strip
    isbn13 = @input
    found_book = isbn13
    if found_book = BookReview::Book.all.detect {|book| book.isbn13 == isbn13}
      return found_book
    else
    BookReview::Api.isbn_lists(isbn13)
    end
  end

  def confirmation
    while BookReview::Book.all.length <= 1
    book = BookReview::Book.all[-1]
    puts "\n\n Book Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}\n\n"
    puts "Is this the book for which you would like to read the NYT review? Type yes or no."
    @input = gets.strip
    if @input == "y" || @input == "yes" || @input == "Y" || @input == "Yes"
      puts "Getting Your Review"
      BookReview::Review.new(book.url)


      while BookReview::Book.all.length > 1
        puts "\n\n Book ID: #{book.book_id}\nBook Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}"
        puts "Which book would you like to select to read the NYT review?"
        BookReview::Book.find_by_id(input)

    elsif @input =="n" || @input == "N" || @input == "No" || @input == "NO"
      greeting
      end
    end
  end
  # def found_book(book)
  #
  #   puts "\n\nBook Title: #{book.book_title}\nAuthor: #{book.book_author}\nSummary: #{book.summary}\n\nISBN13: #{book.isbn13}\n\n"
  #   puts "Is this the book for which you would like to read the NYT review? Type yes or no."
  #   @input = gets.strip
  #   if @input == "y" || @input == "yes" || @input == "Y" || @input == "Yes"
  #     puts "Getting Your Review"
  #     BookReview::Review.new(book.url)
  #
  #   elsif @input =="n" || @input == "N" || @input == "yes" || @input == "Yes"
  #     greeting
  #
  #   end
  # end

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
