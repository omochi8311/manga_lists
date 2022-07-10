class MangaGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :manga
end
