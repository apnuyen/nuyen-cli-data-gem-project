class Scraper

  def self.scrape_index_page(index_url)
    index_doc = Nokogiri::HTML(open(index_url))
    books = []
    index_doc.css(".row.list_item.clearfix").each do |book|
      info = {
        :name => book.search('div.listy_headline').text.strip,
        :author => book.search('div.listy_subhead').text.gsub("By", "").strip,
        :genre => book.search("div.listy_kicker").text.strip,
        :url => book.search("div.listy_body a").map { |link| link['href'] }
      }
      books << info 
    end
    new_array = books.delete_if { |h| h["name"] == "" }
  end

end