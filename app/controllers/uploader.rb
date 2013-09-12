class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [100, 100]
  storage :file

  def store_dir
    'images'
  end

end
