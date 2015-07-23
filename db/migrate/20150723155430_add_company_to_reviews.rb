class AddCompanyToReviews < ActiveRecord::Migration
  def change
  	add_column :company_reviews, :company_id, :integer
  end
end
