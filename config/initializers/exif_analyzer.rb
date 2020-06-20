module ActiveStorage
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
          f_number: 'FNumber',
          iso: 'PhotographicSensitivity',
          date_taken: 'DateTimeOriginal'
        }
        attributes[date_taken] = parse_date(attributes[date_taken])
        attributes.map { |k,v| attributes[k] = exif[v] }
        @blob.update(attributes)
      end

      def parse_date(date_string)
        date_string[0..9] = date_string[0..9].gsub(":", "/")
        DateTime.parse(date_string)
      end
  end
end
