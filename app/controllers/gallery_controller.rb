require File.join(Rails.root, 'app', 'models', 'imagetool.rb')

class GalleryController < ApplicationController
  def index
    @blobs = []
    blobs = ImageTools.list_blobs
    for blob in blobs do
      @blobs.push ImageTools.get_url(blob.name)
    end
  end
end
