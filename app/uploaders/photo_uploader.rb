# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # include Cloudinary::CarrierWave

  # process :convert => 'png'
  # process :tags => ['post_picture']

  version :standard do
    # process resize_to_fill: [1080, 1080, :center]
    process :resize_and_pad_to_1080x1080
    # process :resize_to_fit => [1080, 810], if: :landscape?
  end

  # version :carousel do
  #   process :resize_to_fill => [1080, 1080]
  # end

  version :thumbnail do
    resize_to_fit(100, 100)
  end

  private

  # Method to resize the image and add padding (fill) to make it 1080x1080
  def resize_and_pad_to_1080x1080
    manipulate! do |img|
      img.resize '1080x1080^'           # Resize to fit within 1080x1080, maintaining aspect ratio
      img.gravity 'center'              # Center the image within the canvas
      img.background 'white'            # Set the background color for padding (change if needed)
      # img.extent "1080x1080"            # Extend the canvas to exactly 1080x1080 with padding
      img
    end
  end

  # def landscape?(_)
  #   self.width > self.height
  # end

  # def portrait?(_)
  #   self.width <= self.height
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
