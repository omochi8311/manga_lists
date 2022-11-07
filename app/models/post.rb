class Post < ApplicationRecord
  belongs_to :manga
  belongs_to :customer

  validates :star, presence: true
end
