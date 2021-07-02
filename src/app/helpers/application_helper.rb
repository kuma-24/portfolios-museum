module ApplicationHelper
  require "uri"

  def simple_time(time)
    time.strftime('%Y-%m-%d %H:%M ')
  end

  def text_url_to_link(text)
    URI.extract(text, ["http", "https"]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
    end
    return text
  end
end
