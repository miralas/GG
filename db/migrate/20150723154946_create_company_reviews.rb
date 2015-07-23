class CreateCompanyReviews < ActiveRecord::Migration
  def change
    create_table :company_reviews do |t|
      t.text :review
      t.integer :mark
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
