class NewDraftBuilder
  def initialize(slug)
    @date = Date.today.to_s
    # content = File.open("_drafts/_post_template.md", "r").read
    # content.gsub!('DATE', today)
    # content.gsub!('Title', args[:options].capitalize)
    # content.gsub!('this-post-url', args[:options])
    
    
  end
end