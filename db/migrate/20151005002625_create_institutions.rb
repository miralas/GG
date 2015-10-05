class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :org_type
      t.string :title
      t.string :logo
      t.string :full_adress
      t.string :post_adress
      t.string :phone
      t.string :faks
      t.string :email
      t.string :website
      t.string :director_fio
      t.string :director_post
      t.string :contact_fio
      t.string :contact_phone
      t.string :contact_email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
