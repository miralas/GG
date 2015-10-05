class Institution < ActiveRecord::Base
  belongs_to :user
  mount_uploader :logo, LogoUploader
end
