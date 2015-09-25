class SearchController < ApplicationController

	def search
		case params[:model]
		when 'Вакансии'
			@results = Vacancy.search params[:query]
		when 'Резюме'
			@result = ResumePost.search params[:query]
		when 'Стажировки'
			@result = nil
		end
	end

end
