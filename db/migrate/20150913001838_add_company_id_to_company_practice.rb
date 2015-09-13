class AddCompanyIdToCompanyPractice < ActiveRecord::Migration
  def change
  	add_column :company_practices, :company_id, :integer
  end
end
