class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)

     if post.save
       redirect_to blogs_path, notice: "Successfully created a post!"
    else
       flash.now[:alert] = "Could not save the post, Please try again"
       render :new
     end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
