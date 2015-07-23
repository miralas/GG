class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :logo
      t.string :specialization
      t.references :user, index: true, foreign_key: true
 	
      t.timestamps null: false
    end
  end
end
