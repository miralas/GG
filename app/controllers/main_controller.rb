class MainController < ApplicationController
	def index
		@resumes = Resume.limit(10).reverse
		@news = News.last(3).reverse
		@vacancies = Vacancy.limit(10).reverse
	end
end
