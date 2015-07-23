class AddCompanyToClients < ActiveRecord::Migration
  def change
  	add_column :company_clients, :company_id, :integer
  end
end
