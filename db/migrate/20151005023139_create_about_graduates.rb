class CreateAboutGraduates < ActiveRecord::Migration
  def change
    create_table :about_graduates do |t|
      t.text :about
      t.string :profession
      t.string :achievements
      t.string :competence
      t.string :recomendations
      t.string :photo
      t.references :graduate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
