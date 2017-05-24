module MetaTaggable
  extend ActiveSupport::Concern

  included do
    before_action :read_meta_tags_from_locales
  end

  def blog_meta_tag(blog)
    _image = view_context.image_url(Refile.attachment_url(blog, :image))

    {
      title: blog.title,
      tags: blog.tags.limit(5).pluck(:name).join(','),
      og: {
        type: 'blog',
        url: blog_url(blog),
        title: blog.title,
        thumbnail: _image
      },
      twitter: {
        title: blog.title,
        image: _image
      }
    }
  end

  def tag_meta_tag(tag)
    { title: t('meta_tags.tags.show.title', tag_name: tag.name) }

  def user_meta_tag(user)
    { title: t('meta_tags.users.show.title', user_name: user.name) }
  end

  private

  def read_meta_tags_from_locales
    meta_tag = {}.tap do |tag|
      name_space = "meta_tags.#{controller_name}.#{action_name}"

      %w(title description).each do |property|
        unless t("#{name_space}.#{property}", default: '').blank?
          tag[:"#{property}"] = t("#{name_space}.#{property}")
        end
      end
    end

    set_meta_tags(meta_tag)
  end
end
