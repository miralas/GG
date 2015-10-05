class SearchController < ApplicationController

	def search
		if params[:model] or params[:city]
			case params[:model]
			when 'Вакансии'
				@results = Vacancy.search params[:query]
			when 'Резюме'
				@result = ResumePost.search params[:query]
			when 'Стажировки'
				@result = nil
			end
		else
			@results = Vacancy.search params[:query]
		end
	end

end
