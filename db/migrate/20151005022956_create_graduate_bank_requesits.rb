class CreateGraduateBankRequesits < ActiveRecord::Migration
  def change
    create_table :graduate_bank_requesits do |t|
      t.string :bill
      t.string :bank
      t.string :bank_adress
      t.string :bik
      t.string :inn
      t.string :kpp
      t.string :cor_bill
      t.references :graduate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
