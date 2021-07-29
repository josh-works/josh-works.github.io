
class NewDraftBuilder
  attr_reader :base_content,
              :content
              
  def initialize(slug)
    @base_content = File.open("_drafts/aa-post_template.md", "r").read
    @content = build_output
    # content = File.open("_drafts/_post_template.md", "r").read
    # content.gsub!('DATE', today)
    # content.gsub!('Title', args[:options].capitalize)
    # content.gsub!('this-post-url', args[:options])
  end
  
  def build_output
    @base_content
  end
  
end