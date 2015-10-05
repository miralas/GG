class CreateGraduateRequesits < ActiveRecord::Migration
  def change
    create_table :graduate_requesits do |t|
      t.date :birth_date
      t.string :place_birth
      t.string :nationality
      t.string :sex
      t.string :inn
      t.references :graduate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
