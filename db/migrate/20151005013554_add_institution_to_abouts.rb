class AddInstitutionToAbouts < ActiveRecord::Migration
  def change
    add_reference :abouts, :institution, index: true, foreign_key: true
  end
end
