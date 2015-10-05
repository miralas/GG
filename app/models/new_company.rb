class NewCompany < ActiveRecord::Base
  belongs_to :user
  has_many :company_comments, dependent: :delete_all
  has_many :company_review, dependent: :destroy
  has_many :vacancies, dependent: :destroy
  mount_uploader :logo, LogoUploader

end
