class AddCompanyIdToCompanyPractice < ActiveRecord::Migration
  def change
  	add_column :company_practices, :new_company_id, :integer
  end
end
