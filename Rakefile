require './scripts/new_draft_builder.rb'
require 'html-proofer'

task :test do
  sh "bundle exec jekyll build"
  options = {
    assume_extension: true,
    empty_alt_ignore: true,
    cache: { timeframe: '2w' }
  }
  HTMLProofer.check_directory("./_site", options).run
end

desc "create new draft with `rake \"new_draft['2020-wrapup']\"`"
task :new_draft, [:options] do |task, args|
  content = NewDraftBuilder.new(args[:options]).content
  today = Date.today.to_s
  File.open("_drafts/#{today}-#{args[:options]}.md", "a") do |file|
    file.write(content)
  end
end

# https://stackoverflow.com/questions/825748/how-to-pass-command-line-arguments-to-a-rake-task
# https://www.rubyguides.com/2015/05/working-with-files-ruby/#How_to_Read_Files_In_Ruby