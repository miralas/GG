class CreateCompanyContacts < ActiveRecord::Migration
  def change
    create_table :company_contacts do |t|
      t.string :phone
      t.string :adress
      t.string :fio

      t.timestamps null: false
    end
  end
end
