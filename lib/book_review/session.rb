class BookReview::Session
  def greeting
    puts "Hello!! Welcome to Book Review Selector.\nWhich New York Times Best-selling Book review you like to read?"
    puts "You can select your book by one of the following methods:\nA. By title of book \nB. By author of book (first and last name required)"
    puts "C. By browsing through genre/format lists"
    puts "To exit, enter 'exit'"

    if @input = "exit"
      goodbye

      elsif @input = "A" || "a"
        title_search
      elsif @input = "B" || "b"
        author_search
      elsif @input = "C" || "c"
        gf_search
      else
        invalid_input
      end
  end

  def title_search

  end

  def author_search
    puts "Select a book to see the review"

  end

  def gf_search
      # names of bestseller lists = https://api.nytimes.com/svc/books/v3/lists/names.json

  end

  def invalid_input
    puts "You can select your book by one of the following methods:\nA. By title of book \nB. By author of book (first and last name required)"
    puts "C. By browsing through genre/format lists"
    puts "Please choose A, B, or C."
    puts "To exit, enter 'exit'"
      sleep(2)
  end

  def get_user_input
    @input = gets.strip
  end

  def goodbye
    puts "Thank you for using Book Review Selector. Have a great day!"
  end
end
