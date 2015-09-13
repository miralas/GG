class CreateCompanyPractices < ActiveRecord::Migration
  def change
    create_table :company_practices do |t|
      t.boolean :payment
      t.string :long
      t.string :post
      t.text :description

      t.timestamps null: false
    end
  end
end
