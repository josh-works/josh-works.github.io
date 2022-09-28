require 'date'

desc "create new draft with 'rake new_draft'"
task :new_draft, [:title] do |task, args|
  title = args[:title]
  slug = title.gsub(/\W/, '-')
  puts task, args
  puts title
  content = File.read('_drafts/aa-post_template.md')
  today = Date.today.to_s
  f = File.open("_drafts/#{today}-#{slug}.md", "a") do |file|
    file.write(content)
  end

  puts f.inspect
end

# https://stackoverflow.com/questions/825748/how-to-pass-command-line-arguments-to-a-rake-task
# https://www.rubyguides.com/2015/05/working-with-files-ruby/#How_to_Read_Files_In_Ruby
