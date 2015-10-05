class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :requrements
      t.text :description
      t.string :employment
      t.float :salary
      t.references :new_company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
