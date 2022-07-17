class Manga < ApplicationRecord
  has_many :manga_genres
  has_many :posts
end
