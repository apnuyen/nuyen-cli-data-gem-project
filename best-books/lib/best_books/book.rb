class BestBooks::Book 
	attr_accessor :name, :author, :url, :genre

	def self.all 
		# Scrape NYTIMES page and return books based on that data
		self.scrape_bestlist 
	end 

	def self.scrape_bestlist 
		# go to nytimes page, find the books, extract the properties, instantiate a book
		# ends up with array of books
		books = []

		doc = Nokogiri::HTML(open("https://www.nytimes.com/interactive/2017/books/review/10-best-books-2017.html")) 

		book = self.new
		
		book.name = doc.search("div.listy_headline").text
		book.author = doc.search('div.listy_subhead').text.gsub("By", "").strip
		book.genre = doc.search("div.listy_kicker").text
		book.url = doc.search("div.listy_body a").first.attr('href') 
		 
		book

		books << book

	end 

end 