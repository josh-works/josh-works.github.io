path = './_posts'

@categories = {}

Dir.foreach(path) do |file|
  next if file == "." || file == ".."
  text = File.read(path + "/" + file)
  frontmatter = text.split("\n")[0..8]
  require "pry"; binding.pry
end