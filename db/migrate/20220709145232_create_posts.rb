class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :manga_id,null: false
      t.integer :customer_id,null: false
      t.string :thoughts,null: false
      t.float :star, null: false, default: 0
      t.string :purchase,null: false

      t.timestamps
    end
  end
end
