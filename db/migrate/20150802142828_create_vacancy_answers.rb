class CreateVacancyAnswers < ActiveRecord::Migration
  def change
    create_table :vacancy_answers do |t|
      t.references :resume, index: true, foreign_key: true
      t.references :company_vacancy, index: true, foreign_key: true
      t.datetime :when_viewed

      t.timestamps null: false
    end
  end
end
