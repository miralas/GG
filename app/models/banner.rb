class Banner < ActiveRecord::Base
  belongs_to :banner_region

  def self.save(upload)
    name =  upload.original_filename
    # create the file path
    # write the file
  end
end
