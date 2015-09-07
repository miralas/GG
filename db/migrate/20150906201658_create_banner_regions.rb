class CreateBannerRegions < ActiveRecord::Migration
  def change
    create_table :banner_regions do |t|
      t.string :width
      t.string :height

      t.timestamps null: false
    end
  end
end
