require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

puts 'hello scriptor >>>'

page = 1
last_page = 2
manga_list = []
# last_page = 392

while page <= last_page
  puts page
  page_index = page.to_s
  path = 'http://mangapark.me/search?orderby=views&genres-exclude=doujinshi%2Cyaoi%2Cyuri&page=' + page_index
  scrap = Nokogiri::HTML(open(path)).css("section.search div.content div.manga-list div.item").each_with_index do |file,index|
    data = {
      link: file.css('h2 a')['href'],
      title: file.css('h2 a').text
    }
    manga_list << data
  end
  page += 1
end

# puts manga_list.to_json
File.open('stock.json','w') do |f|
  f.puts manga_list.to_json
end
puts 'pushed to stock.json'
