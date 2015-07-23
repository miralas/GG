class CreateResumeWorks < ActiveRecord::Migration
  def change
    create_table :resume_works do |t|
      t.string :organization
      t.string :region
      t.string :website
      t.string :sphere
      t.string :post
      t.date :begin_work
      t.date :end_work
      t.text :functions
      t.string :skills
      t.text :about
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
