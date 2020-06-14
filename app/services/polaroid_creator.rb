class PolaroidCreator

  def self.call(post)
    post.photos.each do |photo|
      polaroid = Polaroid.new
      polaroid.photo.attach(photo.blob)
      polaroid.save
    end
  end

end
