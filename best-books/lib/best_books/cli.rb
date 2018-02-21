# CLI controller
class BestBooks::CLI
	def call
		list_books 
		menu
	end 

	def list_books 
		# list the top 10 books here as a list
		puts "The 10 Best Books of 2017:"
	end 

	def menu 
		puts "Enter the number of the book you would like more info on or type list to see the list again or type exit to exit:"
		input = nil
		while input != "exit"
			inputs = gets.strip.downcase
			case input 
			when "1"
				puts "More info on book 1..."
			when "2"
				puts "More info on book 2..."
			when "list"
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