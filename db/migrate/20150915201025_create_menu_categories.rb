class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :title
      t.string :link
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
