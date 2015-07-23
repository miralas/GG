class CreateResumePosts < ActiveRecord::Migration
  def change
    create_table :resume_posts do |t|
      t.string :wish_post
      t.string :specialization
      t.float :salary
      t.string :employment
      t.string :timetable
      t.references :resume

      t.timestamps null: false
    end
  end
end
