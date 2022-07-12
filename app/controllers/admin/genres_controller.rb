class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to edit_admin_genre_path(@genre)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])  # データ（レコード）を1件取得
    @genre.destroy  # データ（レコード）を削除
    redirect_to admin_genres_path  # 投稿一覧画面へリダイレクト
  end

  def update
    @genre =Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
