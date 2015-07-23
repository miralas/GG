class AddCompanyToNews < ActiveRecord::Migration
  def change
  	add_column :company_news, :company_id, :integer
  end
end
