class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|

      t.string :title,null: false
      t.string :author,null: false
      t.string :rakuten,null: false
      t.text :isbn
      t.text :rakuten_image_url

      t.timestamps
    end
  end
end
