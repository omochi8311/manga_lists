class Public::HomesController < ApplicationController

  def top
    @mangas = Manga.all.order("created_at DESC").limit(6)
  end
end
