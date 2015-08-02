class VacancyAnswerController < ApplicationController
	def answer
		answer = VacancyAnswer.new
		answer.resume_id = params[:resume]
		answer.vacancy_id = params[:vacancy]
		respond_to do |format|
			if answer.save
				format.html {redirect_to resume_path(params[:resume]), message: 'Отклик на резюме успешно отправлен'}
			end
		end
	end

	def view_answers
		@answers = VacancyAnswer.where(vacancy: params[:vacancy])
		@vacancy = CompanyVacancy.find_by_id(params[:vacancy])
		respond_to do |format|
			format.html { render :view_answers }
		end
	end
end
