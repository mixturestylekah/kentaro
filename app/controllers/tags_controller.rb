class TagsController < ApplicationController
  before_action :set_tag

  def show
    @related_tags = @tag.related_tags
    @blogs = Blog.tagged_with(@tag.name).page(params[:page])
  end

  private

  def set_tag
    @tag = Tag.friendly.find(params[:id])
  end
end
