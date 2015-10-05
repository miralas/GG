class CreateRequesits < ActiveRecord::Migration
  def change
    create_table :requesits do |t|
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.string :oktmo
      t.string :okpo
      t.string :okato
      t.string :okogu
      t.string :okfs
      t.string :okopf
      t.string :okved1
      t.string :okved2
      t.string :okved3s
      t.references :new_company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
