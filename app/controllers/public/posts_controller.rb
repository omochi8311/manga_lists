class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.manga_id = params[:manga_id]
    @isbn_manga = RakutenWebService::Books::Book.search(isbn: @post.manga.isbn)
  end

  def index
    @posts = Post.all
  end
end
