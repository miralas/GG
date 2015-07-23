class AddCompanyToContacts < ActiveRecord::Migration
  def change
  	add_column :company_contacts, :company_id, :integer
  end
end
