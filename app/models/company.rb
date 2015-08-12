class Company < ActiveRecord::Base
  belongs_to :user
	has_one :company_client, dependent: :destroy
  has_one :company_comment, dependent: :destroy
  has_one :company_contact, dependent: :destroy
  has_one :company_news, dependent: :destroy
  has_many :company_review, dependent: :destroy
  has_many :vacancies, dependent: :destroy

  after_create :create_symlinks

  def create_symlinks
  		contact = CompanyContact.new
  		contact.company = self
  		contact.save
  end
end
