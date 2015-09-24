class SearchController < ApplicationController

	def search
		@results = Vacancy.search params['Поиск']
	end

end
