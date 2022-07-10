class CreateMangaGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :manga_genres do |t|

      t.integer :manga_id,null: false
      t.integer :genre_id,null: false

      t.timestamps
    end
  end
end
