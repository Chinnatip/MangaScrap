require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

# TITLE PUTS
puts ">>> scrapping MANGA ..."

# set max volumn
name   = "kingdom"
volumn = 294

def scrapEngine(manga_name, volumn)
  blank     = []
  path_name = manga_name + "_" + volumn.to_s
  puts ">>> " + path_name
  path = "scriptor/stock/" + path_name
  Dir.mkdir(path) unless File.exists?(path)
  var       =  "http://mangapark.me/manga/"+ manga_name + "/"+"s3/c"+ volumn.to_s
  scrap   = Nokogiri::HTML(open(var)).css("div.canvas").each_with_index do |file,i|
    STDOUT.write  "\r#{i+1}" + " <<< compress image ..."
    file_name = path + "/" + manga_name + "_" + volumn.to_s + "_" + (i+1).to_s + ".png"
    img_url   = file.xpath("a[@class='img-link']//img//@src")[0]
    begin
      open( file_name , 'wb') do |file|
        file << open( img_url ).read
      end
    rescue
      puts "error"
    end
  end
  puts
end

while volumn <= 300 do
  scrapEngine(name, volumn)
  volumn += 1
end


puts ">>> finished engine ..."
