class Public::MangasController < ApplicationController

  def new
    params[:isbn]
    @mangas = RakutenWebService::Books::Book.search(isbn: params[:isbn])
    @isbn_manga = RakutenWebService::Books::Book.search(isbn: params[:isbn])
  end

  def index
    @mangas = Manga.all
  end
end
