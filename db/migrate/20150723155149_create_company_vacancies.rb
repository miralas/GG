class CreateCompanyVacancies < ActiveRecord::Migration
  def change
    create_table :company_vacancies do |t|
      t.string :title
      t.text :requirements
      t.text :description
      t.string :employment
      t.integer :salary
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
