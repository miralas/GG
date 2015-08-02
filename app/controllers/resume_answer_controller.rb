class ResumeAnswerController < ApplicationController
	def answer
		answer = ResumeAnswer.new
		answer.resume_id = params[:resume]
		answer.company_id = params[:company]
		respond_to do |format|
			if answer.save
				format.html {redirect_to resume_path(params[:resume]), message: 'Отклик на резюме успешно отправлен'}
			end
		end
	end

	def view_answers
		@answers = ResumeAnswer.where(resume: params[:resume])
		@resume = Resume.find_by_id(params[:resume])
		respond_to do |format|
			format.js { render :view_answers }
		end
	end
end
