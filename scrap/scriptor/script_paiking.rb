require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

# TITLE PUTS
puts ">>> scrapping MANGA ..."

# set max volumn
name   = "Kuroko-no-Basket"
volumn = 275

def scrapEngine(manga_name, volumn)
  blank     = []
  path_name = manga_name + "_" + volumn.to_s
  puts ">>> " + path_name
  path = "scriptor/stock/" + path_name
  Dir.mkdir(path) unless File.exists?(path)
  var       =  "http://www.niceoppai.net/" + manga_name + "/" + volumn.to_s + "/?all"
  scrap   = Nokogiri::HTML(open(var)).css("div.wpm_pag center").each_with_index do |file,i|
    if i > 0
      # STDOUT.write  "\r#{i}" + " <<< compress image ..."
      file_name = path + "/" + manga_name + "_" + volumn.to_s + "_" + (i).to_s + ".png"
      img_url   = file.xpath("img//@src")[0]
      begin
        open( file_name , 'wb') do |file|
          file << open( img_url ).read
        end
      rescue
        # puts "no file to download in " + file_name + '...'
      end
    end
  end
end



i = 200

while i <= volumn do
  scrapEngine(name, i)
  i += 1
end


puts ">>> finished engine ..."
