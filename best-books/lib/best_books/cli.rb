# CLI controller
class BestBooks::CLI
	def call
		list_books 
		menu
	end 

	def list_books 
		# list the top 10 books here as a list
		puts "The 10 Best Books of 2017:"
		@books = BestBooks::Book.all
		@books.each.with_index(1) do |book, i|
			puts "#{i}. #{book.name} - #{book.author}"
		end 
	end 

	def menu 
		input = nil
		while input != "exit"
			puts "Enter the number of the book you would like more info on or type list to see the list again or type exit to exit:"
			input = gets.strip.downcase

			if input.to_i > 0
				the_book = @books[input.to_i-1]
				puts "#{the_book.name} - #{the_book.author}"
			elsif input == "list"
				list_books
			else
				puts "Not sure what you want. Please enter a book number or 'list' to see the list again."
			end 
		end 
	end 

	def goodbye
		puts "Thank you for exploring the top 10 books of 2017!"
	end 
end 