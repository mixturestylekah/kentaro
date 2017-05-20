module BlogsHelper
  def remove_javascript(html)
    html.gsub(/<script.*?>/i, "")
        .gsub(/<\/script>/i, "")
        .gsub(/javascript:/i, "")
        .gsub(/on[\w]+=/i, "")
  end

  def sanitize_html(html)
    sanitize(html, tags: %w(p b i u blockquote br h2 h3 div a img figure figcaption iframe html),
             attributes: %w(class href style))
  end
end
