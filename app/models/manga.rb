class Manga < ApplicationRecord
  has_many :manga_genres
  has_many :genres, through: :manga_genres
  has_many :posts
end
