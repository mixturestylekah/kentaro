class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.order(created_at: :desc).page(params[:page]).per(15)
  end

  def new
    @blog = Blog.new_draft_for(current_user)
  end

  def show
    @blog = Blog.friendly.find(params[:id])
    @related_blogs = @blog.related_blogs

    if request.path != blog_path(@blog)
      redirect_to @blog, status: 301
    end
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.publish
      redirect_to @blog, notice: "ブログを投稿しました！"
    else
      @blog.unpublish
      flash.now[:alert] = "ブログを投稿できませんでした。再度投稿お願いします。"
      render :new
    end
  end

  def update
    @blog.assign_attributes(blog_params)
    if @blog.publish
      redirect_to @blog, notice: "更新できました！"
    else
      @blog.unpublish
      flash.now[:alert] = "投稿できませんでした。再度確認してみてください。"
      render :edit
    end
  end

  def destroy
    @blog.destroy

    redirect_to root_url, notice: "記事を削除しました。"
  end

  private

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :all_tags, :image, :description)
  end

  def authorize_user
    begin
      @blog = current_user.blogs.find(params[:id])
    rescue
      redirect_to root_url
    end
  end
end
