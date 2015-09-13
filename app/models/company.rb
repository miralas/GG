class Company < ActiveRecord::Base
  belongs_to :user
	has_one :company_client, dependent: :destroy
  has_one :company_comment, dependent: :destroy
  has_one :company_contact, dependent: :destroy
  has_one :company_news, dependent: :destroy
  has_many :company_review, dependent: :destroy
  has_many :vacancies, dependent: :destroy

  validates_presence_of :title, :short_name, :english_name

  after_create :create_symlinks
  mount_uploader :logo, LogoUploader

  def create_symlinks
  		contact = CompanyContact.new
  		contact.company = self
  		contact.save
  end
end
