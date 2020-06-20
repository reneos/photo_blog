class AddMetadataColumnsToActiveStorageBlobs < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_blobs, :camera, :string
    add_column :active_storage_blobs, :lens, :string
    add_column :active_storage_blobs, :focal_length, :string
    add_column :active_storage_blobs, :exposure_time, :string
    add_column :active_storage_blobs, :f_number, :string
  end
end
