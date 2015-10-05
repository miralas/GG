class AddInstitutionToRequesits < ActiveRecord::Migration
  def change
    add_reference :requesits, :institution, index: true, foreign_key: true
  end
end
