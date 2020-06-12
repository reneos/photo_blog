class AddPublishedToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :published, :boolean, default: false
  end
end
