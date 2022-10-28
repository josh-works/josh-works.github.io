require 'nokogiri'
require 'open-uri'

class GhibliAnthology
  attr_reader :doc
  def initialize()
    @url = 'https://en.wikipedia.org/wiki/List_of_Studio_Ghibli_works'
    @doc = Nokogiri::HTML(URI.open(@url))
  end

  def table_rows
    @doc.css('Feature_films')
  end
end
