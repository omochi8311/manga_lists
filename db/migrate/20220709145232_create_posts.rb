class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :manga_id,null: false
      t.integer :customer_id,null: false
      t.string :thoughts,null: false
      t.string :evaluation,null: false
      t.string :purchase,null: false

      t.timestamps
    end
  end
end
