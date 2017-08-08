require 'json'
require 'csv'
require 'open-uri'
require 'iconv'
require 'nokogiri'

# TITLE PUTS
puts 'scrap series >>>'

main_link = 'http://www.ddproperty.com/'
container = []

def normalize_uri(uri)
  return uri if uri.is_a? URI
  uri = uri.to_s
  uri, *tail = uri.rpartition "#" if uri["#"]
  URI(URI.encode(uri) << Array(tail).join)
end

def scrap_content(main_link)

  block  = []
  begin
    open(main_link)
  rescue OpenURI::HTTPError => error
    response = error.io
    response.status
    # => ["503", "Service Unavailable"]
    response.string
    # => <!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n<html DIR=\"LTR\">\n<head><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"><meta name=\"viewport\" content=\"initial-scale=1\">...
  end
  #Nokogiri::HTML(open(main_link)).css('li.listing-item').each do |file|
  #parse = {
  #  head: 'hello',
  #  body: 'world'
  #}
  #block << parse
  # end
  puts 'returning'
  return  true #block.to_json.html_safe
end

puts scrap_content(main_link)

puts ">>> finished engine ..."
