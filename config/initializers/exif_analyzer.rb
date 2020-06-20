module ActiveStorage
  # Extracts width and height in pixels from an image blob.
  #
  # If the image contains EXIF data indicating its angle is 90 or 270 degrees, its width and height are swapped for convenience.
  #
  # Example:
  #
  #   ActiveStorage::Analyzer::ImageAnalyzer.new(blob).metadata
  #   # => { width: 4104, height: 2736 }
  #
  # This analyzer relies on the third-party {MiniMagick}[https://github.com/minimagick/minimagick] gem. MiniMagick requires
  # the {ImageMagick}[http://www.imagemagick.org] system library.
  class Analyzer::ImageAnalyzer < Analyzer

    def metadata
      read_image do |image|
        add_exif_data(image)
        if rotated_image?(image)
          { width: image.height, height: image.width }
        else
          { width: image.width, height: image.height }
        end
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end

    private
      def add_exif_data(image)
        exif = image.exif
        attributes = {
          camera: 'Model',
          lens: 'LensModel',
          focal_length: 'FocalLength',
          exposure_time: 'ExposureTime',
          f_number: 'FNumber'
        }
        attributes.map do |property, value|
          attributes[property] = exif[value]
        end
        @blob.update(attributes)
      end

      def read_image
        download_blob_to_tempfile do |file|
          require "mini_magick"
          yield MiniMagick::Image.new(file.path)
        end
      end

      def rotated_image?(image)
        %w[ RightTop LeftBottom ].include?(image["%[orientation]"])
      end
  end
end
