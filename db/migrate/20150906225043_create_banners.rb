class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.references :banner_region, index: true, foreign_key: true
      t.string :path

      t.timestamps null: false
    end
  end
end
