class AddFieldsToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :short_name, :string
  	add_column :companies, :english_name, :string
  end
end
