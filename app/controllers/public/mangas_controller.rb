class Public::MangasController < ApplicationController
  before_action :search

  def new
  end

  def search
    @q = Manga.ransack(params[:q])
  end

  def index
    @manga_search = @q.result(distinct: true)
    @mangas = Manga.all
  end

  private

  def search_params
    params.require(:q).permit!
  end
  def manga_params
    params.require(:manga).permit(:title, :author, :rakuten, :isbn, :rakuten_image_url)
  end
end
