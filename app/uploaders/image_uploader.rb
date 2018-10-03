class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

    process convert: 'jpg'

    version :thumbnail do
      resize_to_fit 215, 430
    end

end