class AddColorToMenuCategory < ActiveRecord::Migration
  def change
  	add_column :menu_categories, :color, :string
  end
end
