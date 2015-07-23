class CreateResumeCourses < ActiveRecord::Migration
  def change
    create_table :resume_courses do |t|
      t.string :title
      t.string :organization
      t.string :specialization
      t.string :expire_year
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
