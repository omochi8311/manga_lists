class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      t.integer :customer_id,null: false
      t.string :title,null: false
      t.string :author,null: false

      t.timestamps
    end
  end
end
