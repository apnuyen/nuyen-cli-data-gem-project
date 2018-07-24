class CommandLineInterface
  BASE_PATH = "https://www.nytimes.com/interactive/2017/books/review/10-best-books-2017.html"

  def run
#    make_books
    start
  end

  #def make_books
   # Scraper.scrape_index_page(BASE_PATH)
#    Book.create_from_collection(books_array) 
  #end

  def display_books
    puts ""
    puts "************* The New York Times 10 Best Books of 2017 *************"
    puts ""
    Book.all.each.with_index(1) do |book, i|
        puts "#{i}. #{book.name.upcase}"
        #puts "  author:" + " #{book.author}"
        #puts "  genre:" + " #{book.genre}"
        #puts "  review:" + " #{book.url}"
        #puts "----------------------"
    end
  end

  def book_info(book)
    puts ""
    puts "-------------- #{book.name} --------------"

    puts ""
    puts "By" + " #{book.author}"
    puts ""

    puts "#{book.genre.upcase}"
    puts "Read more:" + " #{book.url}"
    puts ""
  end 

  def start
    #additional single line below
    Scraper.scrape_index_page(BASE_PATH)
      display_books
      input = nil
      while input != "exit"
        puts ""
        puts "What book would you more information on, by name or number?"
        puts ""
        puts "Enter list to see the books again."
        puts "Enter exit to end the program."
        puts ""
        input = gets.strip
        if input == "list"
          display_books
        elsif input.to_i == 0
          if book = Book.find_by_name(input)
            book_info(book)
          elsif input != 'exit'
            puts "Sorry, I don't seem to understand your request"
          end
        elsif input.to_i > 0
          if book = Book.find(input.to_i)
            book_info(book)
          elsif input != 'exit'
            puts "Sorry, I don't seem to understand your request"
          end
        end
      end
      puts "Goodbye!!!"
    end


end
