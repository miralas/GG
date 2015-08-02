class CreateResumeAnswers < ActiveRecord::Migration
  def change
    create_table :resume_answers do |t|
      t.references :resume, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.datetime :when_viewed

      t.timestamps null: false
    end
  end
end
