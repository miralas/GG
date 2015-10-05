class Graduate < ActiveRecord::Base
  belongs_to :user
  has_one :graduate_requesit
  has_one :graduate_bank_requesit
  has_one :about_graduate
  mount_uploader :photo, LogoUploader
end
