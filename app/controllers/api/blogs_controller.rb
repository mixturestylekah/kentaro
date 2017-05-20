class Api::BlogsController < ApplicationController
  before_action :authenticate_user!

  def update
    @blog = current_user.blogs.find(params[:id])
    @blog.assign_attributes(blog_params)

    if @blog.published?
      @blog.save
    else
      @blog.save_as_draft
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])

    @blog.destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :all_tags, :description, :image)
  end
end
