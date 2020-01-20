class BookReview::Session
  def initialize
    @input
  end
  def greeting
    puts "Hello!! Welcome to Book Review Selector.\nWhich New York Times Best-selling Book review you like to read?"
    puts "You can select your book by one of the following methods:\nA. By title of book \nB. By the thirteen digit ISBN."
    puts "Please type A or B."
    puts "To exit, enter 'exit'"

    get_user_input

    if @input.downcase == "a"
      book = title_search
        confirmation(book)
    elsif @input.downcase == "b"
      book = isbn_search
        confirmation(book)
    elsif @input.downcase == "exit"
      goodbye

    else
      invalid_input
    end

  end

  def title_search
    puts "Please enter the full title of the book:"
    get_user_input
    title = @input
      if found_book = BookReview::Book.all.find {|book| book.book_title.downcase == title.downcase}
        return found_book
      else
    book = BookReview::Api.title_lists(title)
      end
  end

  def isbn_search
    puts "Please enter the thirteen digit ISBN:"
    get_user_input
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
      get_user_input
      if @input.downcase == "y" || @input.downcase == "yes"
        puts "Getting Your Review"
        if book.review
          puts "Found existing review"
          sleep(3)
          book.review.map do |p|
            puts p.text.encode("iso-8859-1").force_encoding("utf-8"), "\n----------------\n"
          end
        else
          puts "Existing review not found. Searching for your review...."
          sleep(3)
          BookReview::Review.new(book)
        end
        puts "Would you like to see another review?"
        get_user_input
        if @input.downcase == "y" || @input.downcase == "yes"
          greeting
        else
          goodbye
        end
      elsif @input.downcase =="n" || @input.downcase == "no"
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

  def get_user_input
    @input = gets.strip
  end

  def goodbye
    puts "Thank you for using Book Review Selector. Have a great day!"
  end
end
