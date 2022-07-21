class Public::HomesController < ApplicationController

  def top
    @mangas = Manga.all
  end
end
