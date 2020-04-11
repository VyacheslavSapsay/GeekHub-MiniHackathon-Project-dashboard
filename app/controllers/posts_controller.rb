class PostsController < ApplicationController
  require 'open-uri'
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    row_post = Nokogiri::HTML(open(params.dig(:post, :url)).read)
    @post.title = row_post.title
    if params.dig(:post, :url).include?("habr")
      @post.body = row_post.at_css('[id="post-content-body"]').text
    elsif params.dig(:post, :url).include?("tsn")
      @post.body = row_post.at_css('[class="e-content"]')
    elsif params.dig(:post, :url).include?("telegra")
      @post.body = row_post.at_css('[id="_tl_editor"]')
    end
    if @post.save
      redirect_to @post, success: "Новая статья успешно создана"
    else
      render :new, danger: "Статья не создана"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: "Статья успешно обновленна"
    else
      render :edit, danger: "Статья не обновлена"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, warning: "Статья удаленна"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:url, category_id: [])
  end
end
