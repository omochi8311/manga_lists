class Post < ApplicationRecord
  belongs_to :manga
  belongs_to :customer

  validates :thoughts, presence: true
  validates :star, presence: true
  validates :purchase, presence: true
end
