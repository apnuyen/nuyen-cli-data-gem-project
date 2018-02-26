class Book 
	attr_accessor :name, :author, :url, :genre

	@@all = []

	def initialize(book_hash)
		book_hash.each do |key, value|
			unless value == ""
				self.send("#{key}=", value)
			end
		end 
		@@all << self 
	end

	def self.create_from_collection(books_array)
    	books_array.each do |hash|
    		unless hash[:name] == ""  
    			Book.new(hash)
    		end 
  		end
	end

  	def self.all
    	@@all
  	end 
end 
