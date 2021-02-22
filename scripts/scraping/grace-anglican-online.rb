require 'nokogiri'
require 'open-uri'

# doc = Nokogiri::HTML(open("http://graceanglicanonline.com/podcast/"))
doc = Nokogiri::HTML(open("http://graceanglicanonline.com/podcast/page/2/"))
results = ""
posts = doc.css("#main").css(".entry-title")
posts.each do |entry|
  url = entry.css("a").first.attribute("href").value
  title = entry.css("a").first.text
  formatted = "[#{title}](#{url})\n"
  results << formatted
end

p results

File.open("./scraping/grace-anglican-results.md", "a+") do |file|
  file.write(results)
end