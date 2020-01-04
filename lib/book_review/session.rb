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
    else
        invalid_input
    end

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

  def self.confirmation
    BookReview::Book.all
    puts "Is this the book you would like to review? Type yes or no."
      @input = gets.strip
      if @input == "y" || @input == "yes" || @input == "Y" || @input == "Yes"
        
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
