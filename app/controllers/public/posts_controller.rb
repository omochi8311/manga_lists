class Public::PostsController < ApplicationController
before_action :search, only: [:index, :search]

  def new
    @post = Post.new
    @post.manga_id = params[:manga_id]
    @manga = Manga.find(params[:manga_id])
  end

  def create
    @post = Post.new(post_params)
    @post.manga_id = params[:manga_id]
    @post.customer_id = current_customer.id
    if@post.save
    redirect_to posts_path
    else
    redirect_to mangas_path
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @manga = Manga.find(params[:manga_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @manga = Manga.find(params[:manga_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10)
    @manga_genres =  MangaGenre.all
    render :index
  end

  def index
    @manga_search = @q.result(distinct: true)
    @posts = Post.all.page(params[:page]).per(10)
    @manga_genres =  MangaGenre.all
    @genre = Genre.all
    @mangas = Manga.all
  end

  private

  def post_params
    params.require(:post).permit(:manga_id, :post_id, :customer_id, :thoughts, :star, :purchase, :is_release)
  end
end