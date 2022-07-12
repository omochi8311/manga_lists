class Manga < ApplicationRecord
  has_one_attached :image
  has_many :manga_genres
  has_many :posts
end
