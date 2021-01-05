require 'httparty'
require 'nokogiri'

class Scraper
  attr_accessor :parse_page

  def initialize(link)
    doc = HTTParty.get(link)
    @parse_page ||= Nokogiri::HTML.parse(doc)
  end

  def get_links
    tags = parse_page.xpath('//a')
    links = []

    tags.map do |tag|
      result = tag.to_s.match(/(www|http:|https:)+[^\s]+[\w]/)
      links.push(result) if result != nil
    end

    links
  end
end

link = 'https://dzone.com/articles/ruby-language-for-beginners-part-2-ruby-methods-1'
scraper = Scraper.new(link)
puts scraper.get_links
