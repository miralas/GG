class Company < ActiveRecord::Base
  belongs_to :user
	has_one :company_client
  has_one :company_comment
  has_one :company_contact
  has_one :company_news
  has_one :compant_review
  has_one :company_vacancy

  after_create :create_symlinks

  def create_symlinks
  		contact = CompanyContact.new
  		contact.company = self
  		contact.save
  end
end
