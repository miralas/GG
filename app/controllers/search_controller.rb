class SearchController < ApplicationController

	def search
		@results = Vacancy.where(title: "%#{params[:phrase]}%")
	end

end
