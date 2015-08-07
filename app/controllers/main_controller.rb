class MainController < ApplicationController
	def index
		if current_user
			if current_user.role == 'user'
				@vacancies = Vacancy.limit(10).reverse
			elsif current_user.role == 'client'
				@resumes = Resume.limit(10).reverse
			end
		else
			@vacancies = Vacancy.limit(10).reverse
		end	
	end
end
