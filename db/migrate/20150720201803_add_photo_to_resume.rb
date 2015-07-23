class AddPhotoToResume < ActiveRecord::Migration
  def change
  	add_column :resumes, :photo, :string
  end
end
