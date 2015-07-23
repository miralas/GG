class CreateResumeRecomendations < ActiveRecord::Migration
  def change
    create_table :resume_recomendations do |t|
      t.string :name
      t.string :post
      t.string :organization
      t.string :phone
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
