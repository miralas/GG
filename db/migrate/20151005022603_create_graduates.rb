class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :lastname
      t.string :name
      t.string :second_name
      t.string :status
      t.string :doc_adress
      t.string :post_adress
      t.string :phone
      t.string :email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
