#require 'dragonfly'
require 'fileutils'

class  ImageTools
  #include Magick

  aspect_ratio = 0.75

  # You can leave +height+ blank if you like.
  def self.thumb_path(blob, w, h)
    "/images/thumbs/#{blob}/#{w.to_i}x#{h.to_i}.jpg"
  end

  # Where to store images in the filesystem when they
  # are created.
  def self.image_path(blob, w, h = nil)
    "#{RAILS_ROOT}/public#{thumb_path(blob, w, h)}"
  end

  def self.create_blob_client
    # Setup a specific instance of an Azure::Storage::Blob::BlobService
    blob_client = Azure::Storage::Blob::BlobService.create(storage_account_name: 'deefredstorage', storage_access_key: 'DbY0ZInVLLD+GcXXZwZCntkBNdtkRp0gxhHYRPQVHnqgVwDKnebUIwSMpQ5B0R9/S420Xs0u1AeV7bPXuDxZ2Q==')
    return blob_client
  end

  def self.get_url(blob_name)
    url = "https://deefredstorage.blob.core.windows.net/deefred/"+blob_name
    return url
  end

  def self.get_blob_properties(blob)
    client = create_blob_client
    blob, content = client.get_blob_properties("deefred", blob)::File.open('download.png', 'wb') {|f| f.write(content)}
    return content
  end

  def self.list_blobs
    client = create_blob_client
    return client.list_blobs("deefred")
  end

  def self.get_blob(blob_name)
    client = create_blob_client
    blob, content = client.get_blob("deefred", blob_name)::File.open('download.png', 'wb') {|f| f.write(content)}
    return content
  end

  # def thumbnail(blob_name, width, height = nil)
  #   blob_content = get_blob(blob_name)
  #   return nil unless blob_content

  #   target = image_path(blob_name, with, height)

  #   height ||= width

  #   img = Image.read(source).first
  #   rows, cols = img.rows, img.columns

  #   source_aspect = cols.to_f / rows
  #   target_aspect = width.to_f / height
  #   thumbnail_wider = target_aspect > source_aspect

  #   factor = thumbnail_wider ? width.to_f / cols : height.to_f / rows
  #   img.thumbnail!(factor)
  #   img.crop!(CenterGravity, width, height)

  #   FileUtils.mkdir_p(File.dirname(target))
  #   img.write(target) { self.quality = 75 }
  # end

end