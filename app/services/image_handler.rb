class ImageHandler

  def self.call(post, params)
    blob = ActiveStorage::Blob.create_after_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )
    post.photos.attach(blob)
    return blob
  end

end
