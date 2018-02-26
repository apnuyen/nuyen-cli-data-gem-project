require_relative "../best_books/scraper.rb"
require_relative "../best_books/book.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInterface
  BASE_PATH = "https://www.nytimes.com/interactive/2017/books/review/10-best-books-2017.html"

  def run
    make_books
    pry
    display_books
  end

  def make_books
    books_array = Scraper.scrape_index_page(BASE_PATH)
    Book.create_from_collection(books_array) 
  end

  def display_books
    Book.all.each.with_index(1) do |book, i|
      unless book.name == ""
        puts "#{i}. #{book.name.upcase}".colorize(:blue)
        puts "  author:".colorize(:light_blue) + " #{book.author}"
        puts "  genre:".colorize(:light_blue) + " #{book.genre}"
        puts "  review:".colorize(:light_blue) + " #{book.url}"
        puts "----------------------".colorize(:green)
      end 
    end
  end

end