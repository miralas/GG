class CreateResumeContacts < ActiveRecord::Migration
  def change
    create_table :resume_contacts do |t|
      t.string :mobile_phone
      t.string :home_phone
      t.string :work_phone
      t.string :email
      t.string :icq
      t.string :skype
      t.string :vk
      t.string :facebook
      t.string :linkedin
      t.references :resume, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
