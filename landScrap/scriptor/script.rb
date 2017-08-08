require 'JSON'
require 'CSV'
require 'open-uri'
require 'nokogiri'

# TITLE PUTS
puts ">>> scrapping LED ..."

# set blank array
blank     = []


#
province     = "%A1%C3%D8%A7%E0%B7%BE"
sub_province = "%E1%BE%E8%A7%A1%C3%D8%A7%E0%B7%BE%C1%CB%D2%B9%A4%C3%201"


# Main function
def scrap( province, sub_province, blank )
  var      = "http://asset.led.go.th/newbid/asset_search_province.asp?search_province=" + province + "&search_sub_province=" + sub_province
  scrap    = Nokogiri::HTML(open(var)).xpath("//tr[@bgcolor='#FFFFFF']").each do |x|
    index  = x.css('td[1]').children.text
    number = x.css('td[2]').children.text
    type   = x.css('td[3]').children.text

    rai    = x.css('td[4]').children.text
    nghan  = x.css('td[5]').children.text
    wa     = x.css('td[6]').children.text

    price  = x.css('td[7]').children.text

    sub_district  = x.css('td[8]').children.text
    district      = x.css('td[9]').children.text
    province      = x.css('td[10]').children.text

    blank << [ index, number, type, rai, nghan, wa, price, sub_district, district, province]
    #puts blank
  end
  # puts scrap
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

# scrap data
scrap( province, sub_province, blank )

# load to csv
# puts stockList
CSV.open("scriptor/stock/land.csv","w") do |file|
  blank.each do |s|
    file << s
  end
end

puts ">>> finished engine ..."
