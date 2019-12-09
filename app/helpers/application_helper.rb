module ApplicationHelper
  require "uri"

  def description_url_to_link(description)
 
    URI.extract(description, ["http", "https"]).uniq.each do |url|
      description.gsub!(url, "#{url}")
    end
    description
  end

  def full_title(page_name = "")
    base_title = "Sample"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
end