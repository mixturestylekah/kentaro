# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host  = 'https://kentaro.run/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create_index  = :auto

SitemapGenerator::Sitemap.create do
  add root_path,        changefreq: 'daily', priority: '1.0'
  add blogs_path,      changefreq: 'daily', priority: '1.0'
  add tags_path, changefreq: 'daily', priority: '0.8'

  Blog.find_each do |blog|
    add blog_path(blog), priority: '1.0', lastmod: blog.updated_at
  end

  Tag.find_each do |category|
    add tag_path(tag), priority: '0.7', lastmod: tag.updated_at
  end

  User.find_each do |user|
    add user_path(user), priority: '0.5', lastmod: user.updated_at
  end
end
