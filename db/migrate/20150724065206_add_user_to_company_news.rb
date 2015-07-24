class AddUserToCompanyNews < ActiveRecord::Migration
  def change
  	add_column :company_news, :user_id, :integer
  end
end
