class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.manga_id = params[:manga_id]
    @mangas = Manga.all
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:manga_id, :customer_id, :thoughts, :evaluation, :purchase, :is_release)
  end
end
