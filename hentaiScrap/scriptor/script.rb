require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

# TITLE PUTS
puts ">>> scrapping N-HENTAI ..."

# Main function
def scrapPage( manga_code, blank)
  var         = "https://nhentai.net/g/" + manga_code + "/"
  manga_title = Nokogiri::HTML(open(var)).css("div#info h1").children.text
  scrap   = Nokogiri::HTML(open(var)).css("div#thumbnail-container div.thumb-container").each_with_index do |file,i|
    title = (manga_title + '_' + (i+1).to_s).gsub(/\s+/, "")
    link  = file.xpath("a//@href").to_s
    blank << [ title,link ]
  end
  return manga_title
end

def scrapEngine(code)
  # Set blank array
  blank     = []
  # Start scrap
  manga_name = code + " - " + scrapPage( code,blank)
  puts ">>> [" + code + "]:" + manga_name
  # Create Folder
  path = "scriptor/stock/" + manga_name
  Dir.mkdir(path) unless File.exists?(path)
  # Download image
  count = blank.count
  blank.each_with_index do |b,i|
    STDOUT.write  "\r#{i+1}" + "/" + count.to_s + " <<< compress image ..."
    var       =  "https://nhentai.net" + b[1]
    url       =  Nokogiri::HTML(open(var)).xpath("//section[@id='image-container']//a//img//@src")
    file_name =  path + '/' + b[0] + ".jpg"
    img_url   =  "http:" + url.to_s
    begin
      open( file_name , 'wb') do |file|
        file << open( img_url ).read
      end
    rescue
      puts "no file to download in " + file_name + '...'
    end
  end
  puts
end

# https://nhentai.net/search/?q=big-penis+dick+crossdressing&sort=popular&page=2

index = ['138573','117487']
# puts index
index.each do |i|
  scrapEngine(i)
end


puts ">>> finished engine ..."
