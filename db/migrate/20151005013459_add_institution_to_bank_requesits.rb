class AddInstitutionToBankRequesits < ActiveRecord::Migration
  def change
    add_reference :bank_requesits, :institution, index: true, foreign_key: true
  end
end
