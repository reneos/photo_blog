class AddIsoColumnToActiveStorageBlobs < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_blobs, :iso, :string
  end
end
