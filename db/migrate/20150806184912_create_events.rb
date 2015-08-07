class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day

      t.timestamps null: false
    end
  end
end
