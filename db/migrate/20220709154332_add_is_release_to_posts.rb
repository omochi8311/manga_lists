class AddIsReleaseToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_release, :boolean,default: false
  end
end
