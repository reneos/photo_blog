class AddDateTakenToActiveStorageBlobs < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_blobs, :date_taken, :datetime
  end
end
