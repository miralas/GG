class CreateBankRequesits < ActiveRecord::Migration
  def change
    create_table :bank_requesits do |t|
      t.string :bill
      t.string :bank
      t.string :adress_bank
      t.string :bik
      t.string :inn
      t.string :kpp
      t.string :cor_bill
      t.references :new_company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
