class IndexController < ApplicationController

  require 'JSON'
  require 'CSV'
  require 'open-uri'
  require 'nokogiri'

  def home
    @manga_lists = get_manga_list
  end

  def chapter
    @path = params[:url_web]
    @chapter = get_chapter(@path)
  end

  def reader
    old_path   = params[:url_link]
    substring  = old_path.length - 1
    @path      = old_path.first(substring)
    @manga_path= params[:url_web]
    @chapter   = get_chapter(@manga_path)
    @image     = get_image_set(@path)
  end

  def get_manga_list
    container = []
    path = 'http://mangapark.me/genre?views'
    scrap = Nokogiri::HTML(open(path)).css("div.ls1 div.item").each_with_index do |file,index|
      genre = []
      # get main url of manga
      link        = 'http://mangapark.me' + file.at_css('ul h3 a').first[1]
      # all_chapter = get_chapter(link)
      # get genre of manga
      file.css('ul li.g a').each do |g|
        genre << g.text
      end
      data = {
        name: file.css('ul h3 a').text ,
        link: link ,
        image: file.css('a.cover img').first['src'].to_s.gsub("60","300") ,
        chapter_lastest: file.css('ul li.b a').text ,
        chapter_link:    'http://mangapark.me' + file.css('ul li.b a').first['href'],
        # chapter_all:     all_chapter ,
        rating:          file.css('ul li div.rate i').text,
        genre:           genre.first(3)
      }
      container << data
    end
    return container
  end

  def get_chapter(path)
    container = []
    scrap = Nokogiri::HTML(open(path)).css("div#list div#stream_1 ul.chapter li").each_with_index do |file,index|
      url_set = []
      file.css('em a').each do |l|
        url_set << l.first[1]
      end
      data = {
        name: file.css('span').text ,
        url:  'http://mangapark.me' + url_set.last + '1'
      }
      container << data
    end
    return container
  end

  def get_image_set(path)
    container = []
    scrap = Nokogiri::HTML(open(path)).css("section.viewer div.canvas").each_with_index do |file,index|
      image = file.css("a.img-link img").first['src']
      container << image
    end
    return container
  end
end
