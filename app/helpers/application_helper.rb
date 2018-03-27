module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      no_images:       true,
      no_links:        true,
      no_tags:         true,
      no_styles:       true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe
  end
end