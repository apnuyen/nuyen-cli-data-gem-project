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

	def self.create_from_collection(collection)
    	collection.each do |hash|
    		unless hash[:name] == "" 
    			Book.new(hash)
    		end 
  		end
	end

  	def self.all
    	@@all
  	end 

  	def self.find(id)
    	self.all[id-1]
  	end

  	def self.find_by_name(name)
    	self.all.detect do |m|
      		m.name.downcase.strip == name.downcase.strip ||
     		m.name.split("(").first.strip.downcase == name.downcase.strip
    	end
  	end
end 
