class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.manga_id = params[:manga_id]
    @manga = Manga.find(params[:manga_id])
  end

  def create
    @post = Post.new(post_params)
    @post.manga_id = params[:manga_id]
    @post.customer_id = current_customer.id
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @manga = Manga.find(params[:manga_id])
  end

  def index
    @posts = Post.all
    @manga = Manga.find(params[:manga_id])
  end

  private

  def post_params
    params.require(:post).permit(:manga_id, :customer_id, :thoughts, :evaluation, :purchase, :is_release)
  end
end
