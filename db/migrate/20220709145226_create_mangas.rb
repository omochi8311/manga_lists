class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|

      t.string :title,null: false
      t.string :author,null: false
      t.string :rakuten,null: false

      t.timestamps
    end
  end
end
