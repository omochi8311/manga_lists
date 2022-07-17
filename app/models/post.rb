class Post < ApplicationRecord
  belongs_to :manga
  belongs_to :customer
end
