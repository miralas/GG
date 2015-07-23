class CreateCompanyClients < ActiveRecord::Migration
  def change
    create_table :company_clients do |t|
      t.string :title
      t.string :website
      t.text :description

      t.timestamps null: false
    end
  end
end
