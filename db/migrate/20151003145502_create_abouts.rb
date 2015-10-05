class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :about
      t.string :count_people
      t.string :achievements
      t.string :pluses
      t.references :new_company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
