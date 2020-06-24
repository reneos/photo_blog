class AddPostDateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :post_date, :datetime
  end
end
