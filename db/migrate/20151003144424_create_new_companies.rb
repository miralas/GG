class CreateNewCompanies < ActiveRecord::Migration
  def change
    create_table :new_companies do |t|
      t.string :company_type
      t.string :full_title
      t.string :short_title
      t.string :english_title
      t.string :specialization
      t.string :logo
      t.string :full_adress
      t.string :post_adress
      t.string :phone
      t.string :faks
      t.string :email
      t.string :website
      t.string :director_name
      t.string :director_post
      t.string :contact_name
      t.string :contacy_phone
      t.string :contact_email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
