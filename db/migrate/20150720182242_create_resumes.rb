class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.date :bith_date
      t.boolean :sex
      t.string :city
      t.string :change_location
      t.string :change_location_place
      t.boolean :ready_business_trip
      t.string :nationality
      t.string :work_ticket
      t.string :time_to_work
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
