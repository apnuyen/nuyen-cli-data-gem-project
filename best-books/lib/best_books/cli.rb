# CLI controller
class BestBooks::CLI
	def call 
		start
	end 

	def list
		# list the top 10 books here as a list
		puts ""
		puts "The NY Times Best Books of 2017:"
		puts ""
		@books = BestBooks::Book.thelist 
		@books.each.with_index(1) do |book, i|
			puts "#{i}. #{book.name}"
		end 
		pry
	end 

	def print_book(book)
		puts ""
		puts "#{book.name} - #{book.author}"
		puts ""
		puts "#{book.genre}"
		puts "Read the review: #{book.url}"
		puts ""
	end 

	def start 
		list 
		input = nil
		while input != "exit"
			puts ""
			puts "Enter the number or name of the book you would like more info on or type list to see the list again." 
			puts ""
			puts "Type exit to end the program."
			input = gets.strip.downcase

			if input.to_i == 0
				if book = BestBooks::Book.find_by_name(input)
					print_book(book)
				end 
			elsif input.to_i > 0
				if book = BestBooks::Book.find(input.to_i)
					print_book(book)
				end 
			elsif input == "list"
				list
			else
				puts "Not sure what you want. Please enter a book number or name, or 'list' to see the list again."
			end 
		end 
		puts "Thank you for exploring the top 10 books of 2017!"
	end 
end 