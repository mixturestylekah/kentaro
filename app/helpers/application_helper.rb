module ApplicationHelper
  def body_class
    "#{controller_name}_controller #{action_name}_action"
  end

  def default_meta_tags
    I18n.t('meta_tags.application').tap do |meta_tag|
      meta_tag.merge!(noindex: true, nofollow: true) if params[:page]
    end
  end
end
