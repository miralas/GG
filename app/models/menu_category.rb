class MenuCategory < ActiveRecord::Base
	has_many :menu_items, dependent: :delete_all
end
