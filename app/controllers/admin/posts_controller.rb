class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(15)
    @manga_genres =  MangaGenre.all
  end
end
