class MenuController < ApplicationController

	def menu
		@menu_categories = MenuCategory.all
		@menu_items = MenuItem.all
	end

end
