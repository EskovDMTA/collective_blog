# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  private

  version :post_avatar do
    process resize_to_fill: [50, 50]
  end

  def size_range
    (1.byte)..(2.megabytes)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
