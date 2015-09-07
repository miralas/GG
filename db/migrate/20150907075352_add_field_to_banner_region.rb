class AddFieldToBannerRegion < ActiveRecord::Migration
  def change
  	add_column :banner_regions, :name, :string
  end
end
