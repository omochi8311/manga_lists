class Admin::MangasController < ApplicationController
  before_action :search

  def new
    if params[:keyword]
        @mangas = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
      @manga = Manga.new
  end

  def search
    @q = Manga.ransack(params[:q])
  end

  def index
    # distinct: trueは重複したデータを除外
    @posts = @q.result(distinct: true)
  end

  private

  def search_params
    params.require(:q).permit!
  end
end
