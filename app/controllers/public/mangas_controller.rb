class Public::MangasController < ApplicationController
before_action :search, only: [:index, :search]

  def new
  end

  def search
    @q = Manga.ransack(params[:q])
    @manga_search  = @q.result(distinct: true).page(params[:page]).per(10)

  end

  def index
    @manga_search = @q.result(distinct: true)
    @mangas = Manga.all.page(params[:page]).per(10)
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def manga_params
    params.require(:manga).permit(:title, :author, :rakuten, :isbn, :rakuten_image_url)
  end
end
