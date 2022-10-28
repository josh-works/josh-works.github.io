require 'nokogiri'
require 'open-uri'

class Getter
  attr_reader :doc
  def initialize
    @doc = Nokogiri::HTML(URI.open("https://www.sengifted.org/providers"))
  end

  def table
    doc.css("table#theTable")
  end
end

# doc.css("a").count => 32
