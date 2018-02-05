namespace :thumbnail_generator do
  desc "Generating thumbnails"
  task generate: :environment do
    #Rake.application.rake_require "#{Rails.root}/app/models/imagetool.rb"
    require File.join(Rails.root, 'app', 'models', 'imagetool.rb')

    blobs = ImageTools.list_blobs

    for blob in blobs do
      #puts ImageTools.get_blob_properties(blob.name)
      puts blob.name
    end

    #puts blobs
  end
end
