require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

# TITLE PUTS
puts ">>> scrapping TRAVELOGA ..."

# set blank array
blank    = []

country  = "BKKA"
airport  = "HKT"
date     = "14-12-2016"
na       = "NA"
ps       = "1.0.0"
classs   = "ECONOMY"

# Main function
def scrap( country , airport , date, na, ps, classs, blank )
  #BKKA.HKT&dt=14-12-2016.NA&ps=1.0.0&sc=ECONOMY
  var     = "https://www.traveloka.com/th-th/fullsearch?ap=" + country + "." + airport + "&dt=" + date + "." + na + "&ps=" + ps + "&sc=" + classs
  scrap   = Nokogiri::HTML(open(var))#.css("div.tv-fs-filters-table").each_with_index do |file,i|
    #puts file
  #end
  puts scrap
end

# set max volumn
=begin
name   = "re_monster"
volumn = 25
volumn.times do |v|
  index = (v+1).to_s
  scrap( name, index , blank )
  puts "scrap " + name + " volumn : " + index
=end

# prepare to compress image
puts '>>> compressing file ...'

# download image to folder
=begin
blank.each_with_index do |b,i|
  file_name = 'scriptor/stock/' + b[0].to_s + ".jpg"
  img_name  = b[1].to_s
  puts file_name
  begin
    open( file_name , 'wb') do |file|
      file << open( img_name ).read
    end
  rescue
    puts "no file to downliad in " + file_name + '...'
  end
=end

scrap( country , airport , date, na, ps, classs, blank )

puts ">>> finished engine ..."
