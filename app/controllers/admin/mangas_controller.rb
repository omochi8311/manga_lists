class Admin::MangasController < ApplicationController
  before_action :search

  def new
    if params[:keyword]
        @mangas = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
      @manga = Manga.new
      @genres = Genre.all
      #binding.pry
  end

  def create
    @manga = Manga.new(manga_params)
    genre = Genre.find(params[:manga][:genre_id])
    @manga.genres << genre
    @manga.save
    redirect_to admin_mangas_path
  end

  def show
  end

  def search
    @q = Manga.ransack(params[:q])
  end

  def index
    # distinct: trueは重複したデータを除外
    @manga_search = @q.result(distinct: true)
    @isbn_manga = Manga.all.page(params[:page]).per(10)
  end

  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy
    redirect_to admin_mangas_path
  end

  private

  def search_params
    params.require(:q).permit!
  end
  def manga_params
    params.require(:manga).permit(:title, :author, :rakuten, :isbn, :rakuten_image_url)
  end
end
